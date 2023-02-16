defmodule ComponexMaterial.Components do#{@color}
  use Phoenix.Component

  attr(:type, :string, default: nil)
  attr(:color, :string, default: "purple")
  attr(:variant, :string, default: "filled")
  attr(:size, :string, default: "medium")
  attr(:rounded, :string, default: "rounded")
  attr(:class, :string, default: nil)
  attr(:rest, :global, include: ~w(disabled form name value))

  slot(:inner_block, required: true)

  def button_x(assigns) do
    ~H"""
    <button
      type={@type}
      class={[
        @size == "small" && "py-2 px-4 text-xs",
        @size == "medium" && "py-3 px-6 text-xs",
        @size == "large" && "py-3.5 px-7 text-sm",
        @rounded == "rounded" && "rounded",
        @rounded == "md" && "rounded-md",
        @rounded == "lg" && "rounded-lg",
        @rounded == "full" && "rounded-full",
        @variant == "elevated" && "middle none center bg-#{@color}-500 font-sans text-xs font-bold uppercase text-white shadow-md shadow-#{@color}-500/20 transition-all hover:shadow-lg hover:shadow-#{@color}-500/40 focus:opacity-[0.85] focus:shadow-none active:opacity-[0.85] active:shadow-none disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none",
        @variant == "filled" && "middle none center bg-#{@color}-500 font-sans text-xs font-bold uppercase text-white shadow-md shadow-#{@color}-500/20 transition-all hover:shadow-lg hover:shadow-#{@color}-500/40 active:opacity-[0.85] disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none",
        @variant == "outline" && "middle none center border border-#{@color}-500 font-sans text-xs font-bold uppercase text-#{@color}-500 transition-all hover:opacity-75 focus:ring focus:ring-#{@color}-200 active:opacity-[0.85] disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none",
        @variant == "text" && "middle none center font-sans text-xs font-bold uppercase text-#{@color}-500 transition-all hover:bg-#{@color}-500/10 active:bg-#{@color}-500/30 disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none",
        @class
      ]}
      {@rest}
    >
      <%= render_slot(@inner_block) %>
    </button>
    """
  end
end
