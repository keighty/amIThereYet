# Column types
#### String
Limited to 255 characters (depending on DBMS)
Use for short text fields (names, emails, etc)
#### Text
Unlimited length
Use for comments, blog posts, etc.

<hr>
General rule of thumb: if it's captured via textarea, use Text. For input using textfields, use string.
<hr>

#### Integer
Whole numbers
#### Float
Decimal numbers stored with floating point precision

Precision is fixed, which can be problematic for some calculations; generally no good for math operations due to inaccurate rounding.
#### Decimal
Decimal numbers stored with precision that varies according to what is needed by your calculations; use these for math that needs to be accurate
#### Date
Stores only a date (year, month, day)
#### Time
Stores only a time (hours, minutes, seconds)
#### DateTime
Stores both date and time
#### Timestamp
Stores both date and time
Note: For the purposes of Rails, both Timestamp and DateTime mean the same thing (use either type to store both date and time). For the TL;DR description of why both exist, read the bottom paragraph.