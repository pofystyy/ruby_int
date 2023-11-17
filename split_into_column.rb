ALERT = 'check input data'

def split_into_column(array, columns)
  return ALERT unless right_data?(array, columns)
  return array if array.count < columns  

  steps = (array.count / columns.to_f).ceil
  
  arr = []
  steps.times do
    arr << array.first(columns) 
    array = array[columns..-1]
  end
  # or
  # arr = array.each_slice(columns).to_a

  count_of_nil = columns - arr.last.count
  arr.last.concat([nil] * count_of_nil)
  
  arr
end

def right_data?(array, columns)
  Array === array && columns.to_i.positive?
end

# a list of data for checking split_into_column()
test_data = [
  [[1,2,3,4,5], 2],                # => [[1, 2], [3, 4], [5, nil]]
  [[1,2,3,4,5], 3],                # => [[1, 2, 3], [4, 5, nil]]
  [[1,2,3,4,5], 7],                # => [1, 2, 3, 4, 5]
  [[1,2,3,4,5,6,7,8,9,10], 8],     # => [[1, 2, 3, 4, 5, 6, 7, 8], [9, 10, nil, nil, nil, nil, nil, nil]]
  [[1,2,3,4,5,6,7,8,9,10], 2],     # => [[1, 2], [3, 4], [5, 6], [7, 8], [9, 10]]
  [[1,2,3,4,5,6,7,8,9,10], 100],   # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  ['hello world', 15],             # => "check input data"
  [[], 0],                         # => "check input data"
  [[], 'foo']                      # => "check input data"
]

test_data.each do |array, columns|
  p split_into_column(array, columns)
end
