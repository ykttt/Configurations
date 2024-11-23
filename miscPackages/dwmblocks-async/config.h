#ifndef CONFIG_H
#define CONFIG_H

// String used to delimit block outputs in the status.
#define DELIMITER "    "

// Maximum number of Unicode characters that a block can output.
#define MAX_BLOCK_OUTPUT_LENGTH 100

// Control whether blocks are clickable.
#define CLICKABLE_BLOCKS 1

// Control whether a leading delimiter should be prepended to the status.
#define LEADING_DELIMITER 0

// Control whether a trailing delimiter should be appended to the status.
#define TRAILING_DELIMITER 1

// Define blocks for the status feed as X(icon, cmd, interval, signal).
#define BLOCKS(X)             \
        X("", "~/repositories/configurations/generalScripts/dwmblocks/net.sh", 1, 4)       \
        X("", "~/repositories/configurations/generalScripts/dwmblocks/snd.sh", 1, 3)       \
        X("", "~/repositories/configurations/generalScripts/dwmblocks/bat.sh", 1, 2)       \
        X("", "~/repositories/configurations/generalScripts/dwmblocks/tmd.sh", 1, 1)       \

#endif  // CONFIG_H
