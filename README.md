# HandBrake Presets
A selection of custom HandBrake presets designed to produce high-quality HEVC (H.265) encodes with manageable file sizes, at the expense of encode speed.

These presets are packaged into a Docker container for convenience, but they can also be used with any recent version of HandBrake

## Overview
- Uses x265 tuned for quality-first encodes
- Audio and subtitle passthrough
- Separate presets for live-action and animation content
- CRF-based encoding for predictable quality
- Files are output as `.mkv`

## Usage
``` bash
docker run --rm -v "$(pwd)":/data davidmatthews/handbrake-presets <input_file> [preset_name] [crf_value]
```

- `<input_file>`: Source video file (must be accessible under /data)
-	`preset_name` (optional): One of the presets listed below
-	`crf_value` (optional): Overrides the preset’s default CRF

If no preset is provided, the 1080p preset is used by default.

### Presets
| Preset name       | Codec         | Encoder | Default CRF |
|-------------------|---------------|---------|-------------|
| `1080p`           | HEVC (H.265)  | x265    | 20          |
| `1080p-animation` | HEVC (H.265)  | x265    | 16          |
| `4k`              | HEVC (H.265)  | x265    | 16          |
| `4k-animation`    | HEVC (H.265)  | x265    | 12          |

## Examples
### Default preset
``` bash
docker run --rm -v "$(pwd)":/data davidmatthews/handbrake-presets video.mkv
```

### 1080p preset with custom CRF
``` bash
docker run --rm -v "$(pwd)":/data davidmatthews/handbrake-presets video.mkv 1080p 22
```

### 4K Animation preset with default CRF
``` bash
docker run --rm -v "$(pwd)":/data davidmatthews/handbrake-presets video.mkv 4k-animation
```

## Links
[GitHub](https://github.com/davidmatthews/docker-handbrake-presets)

[Docker Hub](https://hub.docker.com/r/davidmatthews/handbrake-presets)