import scala.concurrent._
import scala.concurrent.duration.Duration
import ExecutionContext.Implicits.global

object Frequency {
  private def countChars(text: String): Map[Char, Int] =
    text.filter(_.isLetter).groupBy(_.toLower).map{case (c, s) => (c, s.length)}

  private def countChars(texts: Seq[String]): Map[Char, Int] =
    texts.map(s => countChars(s)).foldLeft(Map[Char, Int]())((textMap, acc) => merge(acc, textMap))

  private def merge(map1: Map[Char, Int], map2: Map[Char, Int]) =
    map1 ++ map2.map{ case (key, value) => key -> (value + map1.getOrElse(key,0)) }

  def frequency(numWorkers: Int, texts: Seq[String]): Map[Char, Int] = {
    require(numWorkers >= 1)
    val chunkSize = Math.ceil(texts.size / (numWorkers * 1.0)).asInstanceOf[Int]
    if (chunkSize < 1) return Map()
    val futures: Seq[Future[Map[Char, Int]]] =
      texts.grouped(chunkSize).map(textsChunk => Future {countChars(textsChunk)}).toSeq
    val sequence: Future[Seq[Map[Char, Int]]] = Future.sequence(futures)
    val futuresResult: Seq[Map[Char, Int]] = Await.result(Future.sequence(futures), Duration.Inf)
    futuresResult.foldLeft(Map[Char,Int]())((textMap, acc) => merge(acc, textMap))
  }
}