defmodule ComponexMaterial.Components do#{@color}
  use Phoenix.Component

  attr(:type, :string, default: nil)
  attr(:color, :string, default: "purple")
  attr(:variant, :string, default: "filled")
  attr(:size, :string, default: "md")
  attr(:rounded, :string, default: "rounded")
  attr(:block_level, :boolean, default: false)
  attr(:class, :string, default: nil)
  attr(:rest, :global, include: ~w(disabled form name value))

  slot(:icon)
  slot(:inner_block)

  def button_x(assigns) do
    ~H"""
    <button
      type={@type}
      class={[
        "phx-submit-loading:opacity-75",
        @size == "sm" && "py-2 px-4 text-xs",
        @size == "md" && "py-3 px-6 text-xs",
        @size == "lg" && "py-3.5 px-7 text-sm",
        @rounded == "rounded" && "rounded",
        @rounded == "md" && "rounded-md",
        @rounded == "lg" && "rounded-lg",
        @rounded == "full" && "rounded-full",
        @block_level == true && "w-full",
        @variant == "elevated" && "middle none center bg-#{@color}-500 font-sans text-xs font-bold uppercase text-white shadow-md shadow-#{@color}-500/20 transition-all hover:shadow-lg hover:shadow-#{@color}-500/40 active:opacity-[0.85] disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none",
        @variant == "filled" && "middle none center bg-#{@color}-500 font-sans text-xs font-bold uppercase text-white transition-all hover:shadow-sm hover:opacity-75 active:opacity-[0.85] disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none",
        @variant == "outline" && "middle none center border border-#{@color}-500 font-sans text-xs font-bold uppercase text-#{@color}-500 transition-all hover:opacity-75 focus:ring focus:ring-#{@color}-200 active:opacity-[0.85] disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none",
        @variant == "text" && "middle none center font-sans text-xs font-bold uppercase text-#{@color}-500 transition-all hover:bg-#{@color}-500/10 active:bg-#{@color}-500/30 disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none",
        @class
      ]}
      {@rest}
    >
      <i :if={@icon != []} class="inline-block align-text-bottom h-3 w-3 stroke-current">
        <%= render_slot(@icon) %>
      </i>
      <%= render_slot(@inner_block) %>
    </button>
    """
  end
end
