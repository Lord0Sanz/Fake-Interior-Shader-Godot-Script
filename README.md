# Fake 3D Interior Projection Shaders for Godot

Two optimized shaders for creating convincing 3D interior illusions using 2D texture atlases. Perfect for optimizing mass buildings and adding interior detail to distant objects.

---

## Shaders Available

### 1. Fixed & Tuned Interior Shader  
**Link:** [Fake 3D Interior Projection Shader (Fixed & Tuned)](https://godotshaders.com/shader/fake-3d-interior-projection-shader-fixed-tuned/?post_id=14590&new_post=true)

A pre-calibrated version with optimized offsets and scales for standard texture templates. Perfect for quick setup.

**Features:**
- Pre-tuned offsets & scales for all 6 faces
- Brightness control (0.0-4.0 range)
- Fixed UV calculations and texture clamping
- Optimized ray-box intersection
- Ready-to-use with included texture templates

**Best for:** Quick setup, game jams, standard building interiors

---

### 2. Adjustable Interior Shader  
**Link:** [Fake 3D Interior Projection Shader (Adjustable)](https://godotshaders.com/shader/fake-3d-interior-projection-shader-fixed-adjustable/?post_id=14595&new_post=true)

A fully configurable version with exposed parameters for each face. Perfect for custom interiors.

**Features:**
- Exposed `face_offset[6]` and `face_size[6]` uniforms
- Brightness control (0.0-4.0 range)
- Independent control over each face
- Reference values for easy setup
- Ultimate flexibility for custom atlas layouts

**Best for:** Custom interiors, varied building designs, advanced users

---

## Getting Started

### Quick Setup:
1. **Apply to:** `MeshInstance3D` (Recommended: `QuadMesh` or `PlaneMesh`)
2. **Adjust Z-scale** to control interior depth (higher = deeper rooms)
3. **Use included texture templates** for consistent results
4. **Set brightness** to match your scene lighting

### Texture Requirements:
- **Format:** 6-face atlas texture
- **Layout:** Standard grid-based organization
- **Templates:** Provided with marker guides for easy editing
- **Main Albedo Texture:** [FINAL_TEST.png](https://github.com/Lord0Sanz/Fake-Interior-Shader-Godot-Script/blob/main/assets/texture/FINAL_TEST.png) - Primary wall texture for the shader

---

## Parameter Reference (Adjustable Version)

If you're using the adjustable shader, start with these tested values:

### Offsets:
- **Index 0 (+X face):** `-0.340, 0.75`
- **Index 1 (-X face):** `-0.675, -0.75`
- **Index 2 (+Y face):** `0.1775, -0.5`
- **Index 3 (-Y face):** `0.1775, 0.5`
- **Index 4 (+Z face):** `0.0, 0.0`
- **Index 5 (-Z face):** `0.515, -0.25`

### Sizes:
- **Index 0 (+X face):** `1.35, 1.0`
- **Index 1 (-X face):** `1.35, 1.0`
- **Index 2 (+Y face):** `0.65, 2.0`
- **Index 3 (-Y face):** `0.65, 2.0`
- **Index 4 (+Z face):** `1.0, 1.0`
- **Index 5 (-Z face):** `0.65, 1.0`

---

## Best Practices

### Performance Optimization:
- Use on `QuadMesh` instead of `CubeMesh` for distant buildings
- Single shader can replace hundreds of detailed interior meshes
- Works great with Level of Detail (LOD) systems

### Visual Quality Tips:
- Bake lighting into your atlas textures
- Use higher resolution atlases for foreground buildings
- Combine with decals for additional details
- Animate brightness for day/night cycles

### Creative Uses:
- City skylines with lit windows at night
- Space station interior views
- Dungeon/castle window details
- Sci-fi spaceship interior glimpses

---

## Technical Details

### Both Shaders Include:
- **Render Mode:** Unshaded (full appearance control)
- **Algorithm:** Ray-box intersection with per-face UV mapping
- **Compatibility:** Godot 4.0+ (spatial shader)
- **Performance:** Extremely lightweight - suitable for hundreds of instances

### Fixes & Improvements from Original:
- Fixed UV calculation and face detection
- Added texture clamping to prevent artifacts
- Corrected axes flipping for proper orientation
- Added brightness control parameter
- Optimized for production use

---

## Links & Resources

- **Shader 1 (Tuned):** [Fake 3D Interior Projection Shader Fixed & Tuned Link](https://godotshaders.com/shader/fake-3d-interior-projection-shader-fixed-tuned/?post_id=14590&new_post=true)
- **Shader 2 (Adjustable):** [Fake 3D Interior Projection Shader Fixed & Adjustable Link](https://godotshaders.com/shader/fake-3d-interior-projection-shader-fixed-adjustable/?post_id=14595&new_post=true)
- **Main Albedo Texture:** [FINAL_TEST.png](https://github.com/Lord0Sanz/Fake-Interior-Shader-Godot-Script/blob/main/assets/texture/FINAL_TEST.png)
- **Texture Templates:** Included in download
- **License:** [MIT License](https://github.com/Lord0Sanz/Fake-Interior-Shader-Godot-Script/edit/main/LICENSE)
- **Based on:** "Interior mapping shader" by AndreaTerenz (September 6, 2022)

---

## License

MIT License - Free for personal and commercial use. See [LICENSE](https://github.com/Lord0Sanz/Fake-Interior-Shader-Godot-Script/edit/main/LICENSE) file for full details.

---

## Credits

- **Original Concept:** [AndreaTerenz](https://godotshaders.com/author/andreaterenz/)
- **Optimization & Fixes:** [Lord0San](https://godotshaders.com/author/lord0sanz/)

---

Perfect for game developers, architects, and anyone needing performant interior details without the performance cost.
