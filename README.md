# Componex

Componex is a components library using TailwindCSS for Phoenix framework 1.7+.

---
**IMPORTANT: This library is an early stage of development.**

---

## The Componex Project

Componex is a server-side rendering component library built using `Phoenix.Component` and TailwindCSS that provides a set of reusable components that implement different renowned design systems.

The goal of this project is to simplify and empower developers by providing powerful reusable components so they can focus on creating breathtaking visuals at unrivaled speed.

## Current State

At the current stage, the focus is on creating reusable and flexible components that use the Material Design system created by Google.

These components are being created directly in a common Phoenix framework project and only when we have a reasonable number of components ready for use, the library project will be created and the components will be moved to it.

This approach was chosen because creating a library of reusable components, using dynamic CSS classes and javascript, has several challenges that will need to be addressed at the appropriate time.

Components are currently located inside the `site\site_web\components\components_material` folder in the `components.ex` file. It is in this file that the components must be created.

In the same folder there are files with the `_classes` suffix, which is where the TailwindCSS classes that the component generates dynamically are registered. This is done due to the way in which TailwindCSS detects which classes are in use ([more info](https://tailwindcss.com/docs/content-configuration#configuring-source-paths)). This approach will be reviewed when the library is actually created.

When a component is created, we create a usage example to demonstrate how the component should be used.

## Como contribuir?

We appreciate your contribution! Check open issues and feel free to work, send questions or suggestions to improve the library.
Check our [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) and [CONTRIBUTING.md](CONTRIBUTING.md) guides for more information.

## Running the project

1. Clone the repository
2. Go to `site` folder

```bash
cd site
```
3. Run
```bash
mix phx.server
```

## Important links

- [TailwindCSS](https://tailwindcss.com/)
- [Material Design](https://m3.material.io/)
- [Phoenix Component](https://hexdocs.pm/phoenix_live_view/Phoenix.Component.html)
- [Elixir Forum (Questions)](https://elixirforum.com/)
- [Material Tailwind (for examples of componentes buit using TailwindCSS inspired by Material Design)](https://www.material-tailwind.com/docs/html/installation)