defmodule ComponexMaterial.Components do
  use Phoenix.Component

  attr(:type, :string, default: nil)
  attr(:class, :string, default: nil)
  attr(:variant, :string, default: "elevated")
  attr(:rest, :global, include: ~w(disabled form name value))

  slot(:inner_block, required: true)

  def button_x(assigns) do
    ~H"""
    <button
      type={@type}
      class={[
        @variant == "elevated" && "middle none center mr-3 rounded-lg bg-pink-500 py-3 px-6 font-sans text-xs font-bold uppercase text-white shadow-md shadow-pink-500/20 transition-all hover:shadow-lg hover:shadow-pink-500/40 focus:opacity-[0.85] focus:shadow-none active:opacity-[0.85] active:shadow-none disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none",
        @variant == "filled" && "middle none center mr-3 rounded-lg bg-gradient-to-tr from-pink-600 to-pink-400 py-3 px-6 font-sans text-xs font-bold uppercase text-white shadow-md shadow-pink-500/20 transition-all hover:shadow-lg hover:shadow-pink-500/40 active:opacity-[0.85] disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none",
        @variant == "outline" && "middle none center mr-3 rounded-lg border border-pink-500 py-3 px-6 font-sans text-xs font-bold uppercase text-pink-500 transition-all hover:opacity-75 focus:ring focus:ring-pink-200 active:opacity-[0.85] disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none",
        @variant == "text" && "middle none center rounded-lg py-3 px-6 font-sans text-xs font-bold uppercase text-pink-500 transition-all hover:bg-pink-500/10 active:bg-pink-500/30 disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none",
        @class
      ]}
      {@rest}
    >
      <%= render_slot(@inner_block) %>
    </button>
    """
  end
end
