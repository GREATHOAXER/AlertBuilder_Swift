# AlertBuilder_Swift
This is the example of Builder Pattern using UIAlert Controller

# Usage
- Can choose style of the alertController(.alert, .actionSheet)
- if chose .alert as preferredStyle -> use (setProceedAction, setCancelAction)
- if chose .actionSheet as preferredStyle -> use (addAction for adding actions, setCancelAction for end of the actionSheet)

# ETC
- there is default value for all styles, but it is recommended to set all of the actions you want.
- you can add completion handler for all of the actions you want to add, but the default value will be nil if you not set.
