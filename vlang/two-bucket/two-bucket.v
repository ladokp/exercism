module main

enum BucketId {
  one
  two
}

struct Solution {
  moves        int
  goal_bucket  BucketId
  other_bucket int
}

// Encodes the state of the two buckets into a single integer
fn encode_state(bucket_one int, bucket_two int, capacity_two int) int {
  return bucket_one * (capacity_two + 1) + bucket_two
}

// Extracts the amount in bucket one from the encoded state
fn bucket_one_from_state(state int, capacity_two int) int {
  return state / (capacity_two + 1)
}

// Extracts the amount in bucket two from the encoded state
fn bucket_two_from_state(state int, capacity_two int) int {
  return state % (capacity_two + 1)
}

pub fn measure(capacity_one int, capacity_two int, goal int, start_bucket BucketId) !Solution {
  // Initialize the starting states for both buckets
  start_state_one := encode_state(capacity_one, 0, capacity_two)
  start_state_two := encode_state(0, capacity_two, capacity_two)
  
  mut current_states := map[int]int{}  // Maps state -> number of moves
  mut visited_states := map[int]bool{} // Track visited states to avoid repetition

  // Set the initial state based on the starting bucket
  if start_bucket == .one {
    current_states[start_state_one] = 1
    visited_states[start_state_two] = true
  } else {
    current_states[start_state_two] = 1
    visited_states[start_state_one] = true
  }

  for current_states.len > 0 {
    mut next_states := map[int]int{}
    
    for state, moves in current_states {
      if state in visited_states {
        continue
      }
      visited_states[state] = true

      bucket_one := bucket_one_from_state(state, capacity_two)
      bucket_two := bucket_two_from_state(state, capacity_two)

      // Check if we've reached the goal in either bucket
      if bucket_one == goal {
        return Solution{moves: moves, goal_bucket: .one, other_bucket: bucket_two}
      }
      if bucket_two == goal {
        return Solution{moves: moves, goal_bucket: .two, other_bucket: bucket_one}
      }

      // Try all possible state transitions
      total := bucket_one + bucket_two
      possible_next_states := [
        // Empty either bucket
        encode_state(0, bucket_two, capacity_two),
        encode_state(bucket_one, 0, capacity_two),
        // Fill either bucket to capacity
        encode_state(capacity_one, bucket_two, capacity_two),
        encode_state(bucket_one, capacity_two, capacity_two),
        // Pour from one bucket to the other
        if total <= capacity_two {
          encode_state(0, total, capacity_two)
        } else {
          encode_state(total - capacity_two, capacity_two, capacity_two)
        },
        if total <= capacity_one {
          encode_state(total, 0, capacity_two)
        } else {
          encode_state(capacity_one, total - capacity_one, capacity_two)
        }
      ]
      
      // Add new states to the next iteration
      for new_state in possible_next_states {
        next_states[new_state] = moves + 1
      }
    }

    // Move to the next set of states
    current_states = next_states.move()
  }

  // If we exhaust all possibilities without finding a solution, return an error
  return error('impossible')
}
