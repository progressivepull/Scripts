# Scripts

# Loop

## How to Use the **loop** Script

## **Make Sure the Script Is Executable**

Run this once:

```
chmod +x loop
```

## **Run the create action**

**What the Script Does**

The loop script creates multiple folders using a number range.  
It replaces the * in a name pattern with numbers.

```
./loop create <start> <end> '<pattern>'
```

**Example Usage**

```
./loop.sh create 1 10 'QUESTIONS_NO_*'
```

**What Happens**

This command will create the following folders:

```
QUESTIONS_NO_1  
QUESTIONS_NO_2  
QUESTIONS_NO_3  
...  
QUESTIONS_NO_10
```

**Important Notes**

- Always put the pattern in **quotes**:

```
'QUESTIONS_NO_*'
```

This prevents the system from misinterpreting the *.

- &lt;start&gt; and &lt;end&gt; must be **numbers**.
- The script only supports the create command.

**More Examples**

Create folders from 5 to 8:

```
./loop.sh create 5 8 'TASK_*'
```

Result:

```
TASK_5  
TASK_6  
TASK_7  
TASK_8
```

**Common Mistakes**

- Not using quotes:

./loop create 1 10 QUESTIONS_NO_*

❌ This may not work correctly

- Missing arguments:

./loop create

❌ Not enough information provided

**Summary**

- Use create to make folders
- Provide a start number, end number, and a pattern
- Use * where the number should go
- Always wrap the pattern in quotes
