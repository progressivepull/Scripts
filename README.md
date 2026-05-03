# LoopScript

# Pandoc
* [Pandoc Official Website](https://pandoc.org/)

``` bash
pandoc -t gfm --extract-media . "main.docx" -o main.md
```

# Microsoft Word Code Style
* [MS Word Create style for code snippet box  | Leon Renner | YouTube](https://www.youtube.com/watch?v=busnzKKSOxU)

# Scripts

# Say Hello

Make it executable:

```
chmod +x say_hello.sh
```
Run it:

```
say_loop.sh
```
You’ll see:

```
Hello
```

# Loop

# 🏗️ CREATE MODE

## How to Use the **loop** Script

## **Make Sure the Script Is Executable**

Run this once:

```
chmod +x loop.sh
```

## **Run the create action**

**-f Flag**

**What the Script Does**

The loop script creates multiple folders using a number range.  
It replaces the * in a name pattern with numbers.

```
loop.sh create -f <start> <end> '<pattern>'
```

**Example Usage**

```
loop.sh create -f 1 10 'QUESTIONS_NO_*'
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
loop.sh create -f 5 8 'TASK_*'
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

loop.sh create -f 1 10 QUESTIONS_NO_*

❌ This may not work correctly

- Missing arguments:

loop.sh create -f

❌ Not enough information provided

**Summary**

- Use create to make folders
- Provide a start number, end number, and a pattern
- Use * where the number should go
- Always wrap the pattern in quotes

# 🗑️ DELETE MODE
The delete action removes a single file.

## ✅ Command Format

``` bash
./loop.sh delete <filename>
```

## 📌 Example

``` bash
./loop.sh delete w.txt
```
If the file exists, you will see:

``` 
Running delete
Deleted w.txt
```
If not:

``` 
Running delete
w.txt does not exist
```

# Convert DOCX → Markdown
Convert a .docx file to GitHub‑Flavored Markdown using Pandoc.
Images are extracted into a media/ folder.

## -f Flag

``` bash
./loop.sh convert -s <file_name>
```
### Example

```
./loop.sh convert -s main

```
This converts:

```
main.docx → main.md

```

## -m Flag

**loop.sh convert -m** scans all folders for **.docx** files, enters each folder
that contains one, and converts every **.docx** file into a GitHub‑Flavored
Markdown **(.md)** file. During conversion, **Pandoc** extracts all embedded
images into a companion media folder named:

``` 
<filename>_media/
```

The resulting Markdown file uses clean relative image paths such as:

```
<img src="./<filename>_media/media/image1.png">
```

This ensures the **.md** file and its media folder stay together and work
correctly when moved, uploaded, or committed to version control.

**What the command does**

- Searches recursively for all **.docx** files.

- For each file:

  - Changes into the directory where the .docx file is located.

  - Runs Pandoc to convert the document into Markdown.

  - Extracts images into \<filename\>\_media/media/.

  - Writes \<filename\>.md next to the original .docx.

- Produces Markdown with correct relative image paths.

**Folder structure before and after**

**Before**

```
PROBLEM_1/
	PROBLEM_1.docx
```

**After running loop.sh convert -m**

```
PROBLEM_1/
	PROBLEM_1.docx
	PROBLEM_1.md
	PROBLEM_1_media/
		media/
			image1.png
			image2.jpeg
```

**Example of generated Markdown image tag**

```html
<img src="./PROBLEM_1_media/media/image1.png" style="width:1.84401in;height:0.66676in" \>
```

This path works because the .md file and _media folder are siblings in
the same directory.

**When to use this command**

Use **convert -m** when you want to:

- Convert many .docx files at once.

- Preserve images with correct relative paths.

- Keep each document’s media self‑contained.

- Prepare Markdown for GitHub, GitLab, Obsidian, MkDocs, or static site
  generators.



# Help
Show all available commands:

``` bash
./loop.sh help
```
