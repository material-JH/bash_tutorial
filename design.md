---
version: alpha
name: KENTECH Academic Technology
summary: KENTECH-inspired visual style for the Linux command tutorial slide deck.
description: Clean university research style with white space, deep navy, bright cyan, thin divider rules, crisp rectangular panels, and minimal line-symbol accents.
colors:
  primary: "#004098"
  secondary: "#00AEEF"
  tertiary: "#151515"
  neutral: "#FFFFFF"
  surface: "#F6FAFE"
  surfaceAlt: "#EEF4FA"
  mutedText: "#52606D"
  dimText: "#7A8793"
  divider: "#D8E2EC"
  terminal: "#101923"
  terminalText: "#E7F6FF"
  warning: "#C98300"
  danger: "#D92D20"
  success: "#006B5F"
typography:
  h1:
    fontFamily: Roboto, Noto Sans KR, NanumSquare, Arial, sans-serif
    fontSize: 104px
    fontWeight: 700
    lineHeight: 0.98
    letterSpacing: "-0.055em"
  h2:
    fontFamily: Roboto, Noto Sans KR, NanumSquare, Arial, sans-serif
    fontSize: 72px
    fontWeight: 700
    lineHeight: 1.05
    letterSpacing: "-0.045em"
  body-md:
    fontFamily: Roboto, Noto Sans KR, NanumSquare, Arial, sans-serif
    fontSize: 30px
    fontWeight: 400
    lineHeight: 1.35
  mono:
    fontFamily: ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, Liberation Mono, monospace
    fontSize: 28px
    fontWeight: 500
    lineHeight: 1.48
rounded:
  none: 0px
  sm: 4px
  md: 8px
  pill: 999px
spacing:
  xs: 8px
  sm: 14px
  md: 24px
  lg: 42px
  xl: 86px
components:
  slide-surface:
    backgroundColor: "{colors.neutral}"
    textColor: "{colors.tertiary}"
    rounded: "{rounded.md}"
    padding: 86px
  section-header:
    backgroundColor: "{colors.neutral}"
    textColor: "{colors.primary}"
    rounded: "{rounded.none}"
    padding: 0px
  card:
    backgroundColor: "{colors.neutral}"
    textColor: "{colors.tertiary}"
    rounded: "{rounded.sm}"
    padding: 32px
  terminal-panel:
    backgroundColor: "{colors.terminal}"
    textColor: "{colors.terminalText}"
    rounded: "{rounded.md}"
    padding: 28px
  outline-button:
    backgroundColor: "{colors.neutral}"
    textColor: "{colors.primary}"
    rounded: "{rounded.none}"
    padding: 14px
  card-subtle:
    backgroundColor: "{colors.surface}"
    textColor: "{colors.tertiary}"
    rounded: "{rounded.sm}"
    padding: 32px
  flow-row:
    backgroundColor: "{colors.surfaceAlt}"
    textColor: "{colors.tertiary}"
    rounded: "{rounded.sm}"
    padding: 26px
  cyan-marker:
    backgroundColor: "{colors.secondary}"
    textColor: "{colors.terminal}"
    rounded: "{rounded.pill}"
    padding: 8px
  muted-label:
    backgroundColor: "{colors.mutedText}"
    textColor: "{colors.neutral}"
    rounded: "{rounded.none}"
    padding: 8px
  dim-label:
    backgroundColor: "{colors.terminal}"
    textColor: "{colors.dimText}"
    rounded: "{rounded.none}"
    padding: 8px
  divider-rule:
    backgroundColor: "{colors.divider}"
    textColor: "{colors.tertiary}"
    rounded: "{rounded.none}"
    padding: 8px
  warning-rule:
    backgroundColor: "{colors.terminal}"
    textColor: "{colors.warning}"
    rounded: "{rounded.none}"
    padding: 8px
  danger-rule:
    backgroundColor: "{colors.neutral}"
    textColor: "{colors.danger}"
    rounded: "{rounded.none}"
    padding: 8px
  success-rule:
    backgroundColor: "{colors.success}"
    textColor: "{colors.neutral}"
    rounded: "{rounded.none}"
    padding: 8px
---

## Overview

This file defines a KENTECH-inspired academic technology style for the Linux command tutorial presentation. The style should feel like a Korean research university page: precise, spacious, bright, science-oriented, and institutional rather than decorative.

Use KENTECH as visual inspiration only. Do not copy the KENTECH logo or site assets. Instead, borrow the general graphic language: white page, deep navy/cyan identity colors, thin rules, small dot markers, chevrons, crisp panels, and dark institutional footer controls.

## Colors

- **Primary navy (`#004098`)** is the main identity color. Use it for section labels, progress, left rules, timeline markers, and important command prompts.
- **Cyan (`#00AEEF`)** is the active science/energy accent. Use it sparingly for dots, highlights, focus rings, and secondary prompts.
- **White and pale blue surfaces** replace the previous dark-space theme. Most slides should read like clean research brochure pages.
- **Dark charcoal terminal (`#101923`)** preserves code readability and provides contrast against the white deck.
- **Warning/danger colors** remain available for safety guidance, but should appear as disciplined accent rules rather than large saturated blocks.

## Typography

Use a modern institutional sans-serif stack similar to the reference site: `Roboto`, `Noto Sans KR`, `NanumSquare`, `Arial`, `sans-serif`. Headings are bold with tight letter spacing, while body and list text keep generous line-height for beginner readability.

Monospace text should stay visually distinct in terminal panels and command labels. Keep command examples dark-on-light only when short; full command sessions should remain in dark terminal panels.

## Layout

Preserve the existing 16:9 slide deck and all existing slide content/layout. The style layer should only change graphic treatment:

- Keep the existing grid classes and slide dimensions.
- Keep content order, text, and slide count unchanged.
- Replace dark gradients with white/pale-blue surfaces.
- Add KENTECH-like top rules, two-dot section markers, chevrons, and subtle grid/dot symbols without moving slide content.

## Elevation & Depth

Use very light shadows, thin borders, and flat rectangular surfaces. Avoid heavy glow effects. The reference style feels web-institutional, not glassmorphism.

Cards may use a small shadow and a navy top/left rule. Terminal blocks can use deeper contrast but should still have crisp edges and thin cyan/navy borders.

## Shapes

Prefer rectangles and sharp/slightly rounded corners. Use:

- 0–4px radius for cards and rows.
- Circular dots only for brand markers and bullets.
- Chevrons (`›`) for progression/link symbolism.
- A small 3×3 square/dot grid as a KENTECH-style utility/menu motif.

Avoid large pill cards, neon rings, and rounded glass panels unless used as subtle background decoration.

## Components

- **Slide header:** Thin gray divider with a short navy accent rule and two small dots before the section tag.
- **Cards:** White or pale-blue panels with a navy/cyan top rule. Strong/warn/danger variants use restrained border colors.
- **Flow rows:** White rows with a navy left rule and a right-side cyan chevron.
- **Pipeline nodes:** Rectangular white modules connected by navy arrows.
- **Terminal:** Dark charcoal/navy panel with cyan prompt highlights and muted gray comments.
- **Footer/controls:** Dark institutional bar/control buttons with white text and cyan progress.

## Do's and Don'ts

Do:

- Keep the tutorial content and slide layout unchanged.
- Use navy/cyan accents consistently.
- Use thin dividers, dot markers, and chevrons to create KENTECH-like rhythm.
- Maintain high contrast for Korean text and terminal examples.

Don't:

- Copy KENTECH logos, photographs, or proprietary assets.
- Introduce complex animations or decorative graphics that distract beginners.
- Replace terminal/code readability with light decorative styling.
- Change the educational text, slide order, or grid layout while applying this style.
