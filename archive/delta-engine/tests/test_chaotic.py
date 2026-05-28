import numpy as np
import matplotlib.pyplot as plt

def generate_rhythm_sequence(initial_rhythms, iterations_per_value=5):
    """
    Generates a continuous sequence of rhythms using a nonlinear sinusoidal function.
    
    Args:
        initial_rhythms (list): Initial list of rhythm values
        iterations_per_value (int): Number of iterations for each initial value
        
    Returns:
        list: Complete sequence of rhythmic values
    """
    def nonlinear_function(x):
        # Normalized sinusoidal function that maintains reasonable rhythm values
        return abs(10*np.sin(x*np.pi+x)+1/(x+0.001))
    
    complete_sequence = []
    
    # Process each initial rhythm and its iterations
    for initial_rhythm in initial_rhythms:
        current_value = initial_rhythm
        complete_sequence.append(current_value)
        
        # Generate predictions
        for _ in range(iterations_per_value):
            next_value = round(nonlinear_function(current_value))
            complete_sequence.append(next_value)
            current_value = next_value
    
    return complete_sequence

# Initial rhythm sequence
initial_rhythms = [3, 5, 4]
iterations_per_value = 5

# Generate the complete sequence
rhythm_sequence = generate_rhythm_sequence(initial_rhythms, iterations_per_value)

# Print the complete sequence
print("\nComplete Rhythm Sequence:")
print("=======================")
print(rhythm_sequence)

# Create segment markers for visualization
segment_boundaries = [i * (iterations_per_value + 1) for i in range(len(initial_rhythms) + 1)]
segments = [rhythm_sequence[start:end] for start, end in zip(segment_boundaries[:-1], segment_boundaries[1:])]

# Plotting
plt.figure(figsize=(12, 6))

# Plot the complete sequence as one continuous line
plt.plot(rhythm_sequence, 'b-o', label='Complete Sequence')

# Add vertical lines to separate segments from different initial rhythms
for boundary in segment_boundaries[1:-1]:
    plt.axvline(x=boundary-0.5, color='gray', linestyle='--', alpha=0.5)

# Add annotations for initial values
for i, initial_value in enumerate(initial_rhythms):
    plt.text(i*(iterations_per_value + 1), initial_value, 
             f'Start: {initial_value}', 
             horizontalalignment='right',
             verticalalignment='bottom')

plt.title('Continuous Rhythm Evolution through Nonlinear Function')
plt.xlabel('Sequence Position')
plt.ylabel('Rhythm Value')
plt.grid(True)
plt.legend()
plt.show()

# Print analysis of the sequence
print("\nSequence Analysis:")
print("=================")
print(f"Total length: {len(rhythm_sequence)} values")
print(f"Value range: {min(rhythm_sequence)} to {max(rhythm_sequence)}")
print("\nSegment breakdown:")
for i, segment in enumerate(segments):
    print(f"Segment {i+1} (starting from {initial_rhythms[i]}): {segment}")