# Setup Workspace Command

**Task**: Analyze the project and configure custom workspace colors for VS Code.

## Usage

```bash
/setup-workspace [primary] [secondary]
```

**Arguments**:
- `[primary]` (optional): Primary color or theme keyword
- `[secondary]` (optional): Secondary color (only used with primary color)

**Examples**:
- `/setup-workspace` - Interactive mode, prompts for color selection
- `/setup-workspace red` - Apply Red + Orange theme
- `/setup-workspace ocean` - Apply Blue + Teal theme
- `/setup-workspace red blue` - Apply Red primary + Blue secondary
- `/setup-workspace purple orange` - Apply Purple primary + Orange secondary

## Steps

1. **Parse Command Arguments**
   - Check if any color arguments were provided
   - **No arguments**: Proceed with interactive workflow
   - **One argument**: Match against theme keywords or single-color mappings
   - **Two arguments**: Use first as primary, second as secondary (custom pairing)

2. **Detect Project Context**
   - Get the current project directory name
   - Extract project name from git remote (if available)
   - Identify project type/purpose from README or package.json

3. **Initialize VS Code Workspace**
   - Check if `.vscode/settings.json` exists
   - If not, create `.vscode/` directory
   - Copy `.claude/templates/vscode-settings-template.json` to `.vscode/settings.json`

4. **Analyze Current Color Scheme**
   - Read `.vscode/settings.json`
   - Extract current primary and secondary colors
   - Check if colors are still default template (Green: `#22c55e`/`#166534`, Brown: `#78350f`/`#d97706`)

5. **Determine Theme to Apply**

   **If two color arguments provided** (e.g., `/setup-workspace red blue`):
   - Use first argument as primary color
   - Use second argument as secondary color
   - Look up hex codes from Color Hex Code Mapping
   - Calculate blended background color
   - Apply custom pairing immediately
   - Skip interactive prompts

   **If one color argument provided** (e.g., `/setup-workspace red`):
   - Match argument against theme keywords (see Theme Keyword Mapping below)
   - Apply matching predefined theme immediately
   - Skip interactive prompts

   **If no arguments (interactive mode)**:
   - Infer theme from project name using keyword matching
   - Present options to user:
     - A) Use inferred theme (if matched)
     - B) Choose from 10+ example color pairings
     - C) Keep current colors

6. **Apply Color Scheme**
   - If user selects a theme, update `.vscode/settings.json`
   - Replace all 7 color instances:
     - Primary bright (line 8)
     - Primary dark (line 9)
     - Secondary dark (line 12)
     - Secondary light (line 13)
     - Background tint (line 16)
     - Theme name comment (line 3)
   - Confirm completion with theme name and colors

7. **Generate Audio Completion Notification**
  - Create `.claude/audio/` directory if it doesn't exist
  - Generate WAV audio file using macOS `say` command with AIFF output, then convert:
    ```bash
   say -o .claude/audio/completion.aiff "[Project Name] is finished."
   afconvert .claude/audio/completion.aiff .claude/audio/completion.wav -d LEI16@44100 -f WAVE
   rm .claude/audio/completion.aiff
    ```
  - Example: For project "the_phoenix_project", generate "The phoenix project is finished."
  - WAV format works on both macOS (afplay) and Windows (native)
  - Replace the audio file if there already is one there


8. **Success Confirmation**
  ```
  ✅ Workspace colors updated to [Theme Name]!
  - Primary: [Color Name] (#hexcode)
  - Secondary: [Color Name] (#hexcode)


  ✅ Audio notification created: .claude/audio/completion.wav
  ```

## How to Enable/Disable Features

### Audio Completion Notifications

**To Enable**: Add this to `.claude/settings.json` under `"hooks"`:
```json
{
  "hooks": {
    "Stop": {
      "command": "afplay .claude/audio/completion.wav 2>/dev/null || true"
    }
  }
}
```

**To Disable**: Remove the `"Stop"` hook from `.claude/settings.json`

**How it works**: After each prompt completion, the hook plays the audio file saying "[Project Name] is finished."

### Workspace Colors

**To Change Colors**: Run `/setup-workspace` command again and select a new theme

**To Revert to Defaults**: Manually edit `.vscode/settings.json` and restore:
- Primary: `#22c55e` (bright), `#166534` (dark)
- Secondary: `#78350f` (dark), `#d97706` (light)
- Background: `#1f2617`

## Color Hex Code Mapping

**For custom two-color pairings**, use these base colors:

- `red`: Bright `#ef4444`, Dark `#991b1b`
- `orange`: Bright `#f97316`, Dark `#9a3412`
- `yellow`: Bright `#fde047`, Dark `#854d0e`
- `green`: Bright `#22c55e`, Dark `#166534`
- `teal`: Bright `#14b8a6`, Dark `#0f766e`
- `blue`: Bright `#3b82f6`, Dark `#1e40af`
- `cyan`: Bright `#06b6d4`, Dark `#0e7490`
- `purple`: Bright `#a855f7`, Dark `#6b21a8`
- `magenta`: Bright `#ec4899`, Dark `#9f1239`
- `pink`: Bright `#ec4899`, Dark `#9f1239`
- `brown`: Bright `#d97706`, Dark `#78350f`
- `navy`: Bright `#93c5fd`, Dark `#1e3a8a`
- `sage`: Bright `#84cc16`, Dark `#365314`
- `gray`: Bright `#9ca3af`, Dark `#4b5563`
- `white`: Bright `#f3f4f6`, Dark `#d1d5db`
- `silver`: Bright `#e5e7eb`, Dark `#9ca3af`
- `black`: Bright `#6b7280`, Dark `#1f2937`

## Theme Keyword Mapping

**Single-color keywords** (apply predefined theme):
- `red` → Red + Orange
- `orange` → Orange + Yellow
- `yellow` → Orange + Yellow
- `green` → Green + Brown
- `teal` → Teal + Sage
- `blue` → Blue + Teal
- `cyan` → Cyan + Navy
- `purple` → Purple + Blue
- `magenta` → Magenta + Purple
- `pink` → Pink + Orange
- `brown` → Green + Brown

**Multi-color keywords** (specific pairings):
- `ocean` → Blue + Teal
- `fire` → Red + Orange
- `royal` → Purple + Blue
- `sunset` → Pink + Orange
- `tech` → Cyan + Navy
- `nature` → Green + Brown
- `earth` → Teal + Sage
- `energy` → Orange + Yellow

## Color Pairings with Hex Codes

**Nature:**
- Green + Brown: `#22c55e`, `#166534`, `#78350f`, `#d97706`, `#1f2617`
- Teal + Sage: `#14b8a6`, `#0f766e`, `#365314`, `#84cc16`, `#1a2617`

**Ocean:**
- Blue + Teal: `#3b82f6`, `#1e40af`, `#0f766e`, `#5eead4`, `#1a2e3e`
- Cyan + Navy: `#06b6d4`, `#0e7490`, `#1e3a8a`, `#93c5fd`, `#1a2d3e`

**Fire:**
- Red + Orange: `#ef4444`, `#991b1b`, `#9a3412`, `#fdba74`, `#2e1a1a`
- Orange + Yellow: `#f97316`, `#9a3412`, `#854d0e`, `#fde047`, `#2e1f1a`

**Royal:**
- Purple + Blue: `#a855f7`, `#6b21a8`, `#1e40af`, `#93c5fd`, `#2a1e3e`
- Magenta + Purple: `#ec4899`, `#9f1239`, `#6b21a8`, `#d8b4fe`, `#2e1a2e`

**Sunset:**
- Pink + Orange: `#ec4899`, `#9f1239`, `#9a3412`, `#fdba74`, `#2e1a1e`
- Rose + Gold: `#f43f5e`, `#9f1239`, `#854d0e`, `#fde047`, `#2e1a17`

**Energy:**
- Orange + Yellow: `#f97316`, `#9a3412`, `#854d0e`, `#fde047`, `#2e1f1a`

**Tech:**
- Cyan + Navy: `#06b6d4`, `#0e7490`, `#1e3a8a`, `#93c5fd`, `#1a2d3e`

**Earth:**
- Teal + Sage: `#14b8a6`, `#0f766e`, `#365314`, `#84cc16`, `#1a2617`

## Success Criteria

- Project name detected correctly
- Current color scheme analyzed
- Appropriate theme suggested (if keywords match)
- User presented with clear options
- Colors applied correctly if user selects a theme
- Confirmation message displays new theme details
