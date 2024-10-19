<?php

declare(strict_types=1);

function meetup_day(int $year, int $month, string $which, string $weekday): DateTimeImmutable
{
    $validWhich = ['first', 'second', 'third', 'fourth', 'fifth', 'last', 'teenth'];
    $validWeekdays = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];

    if (!in_array($which, $validWhich) || !in_array(ucfirst(strtolower($weekday)), $validWeekdays)) {
        throw new InvalidArgumentException("Invalid input for 'which' or 'weekday'");
    }

    $monthName = DateTimeImmutable::createFromFormat("!m", str_pad((string)$month, 2, "0", STR_PAD_LEFT))->format('F');

    if ($which !== "teenth") {
        return new DateTimeImmutable("$which $weekday of $monthName $year");
    }

    // Calculate the 'teenth' date
    $date = new DateTimeImmutable("13th $monthName $year");
    while ($date->format('l') !== ucfirst(strtolower($weekday))) {
        $date = $date->modify('next day');
    }

    return $date;
}
