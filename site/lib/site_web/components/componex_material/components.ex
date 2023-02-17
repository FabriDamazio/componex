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

  attr(:variant, :string, default: "standard")
  attr(:label, :string, default: "")
  attr(:placeholder, :string, default: "")

  def input_x(assigns) do
    ~H"""
    <div class={[
      "relative w-full min-w-[200px]",
      (@variant == "static" || @variant == "standard") && "h-11",
      @variant == "outline" && "h-10"
      ]}>
      <input
        placeholder={
          @variant == "static"  && "#{@placeholder}" ||
          (@variant == "standard" || @variant == "outline") && " "
          }
        class={[
          (@variant == "static" || @variant == "standard") && "peer h-full w-full border-b border-blue-gray-200 bg-transparent pt-4 pb-1.5 font-sans text-sm font-normal text-blue-gray-700 outline outline-0 transition-all placeholder-shown:border-blue-gray-200 focus:border-pink-500 focus:outline-0 disabled:border-0 disabled:bg-blue-gray-50",
          @variant == "outline" && "peer h-full w-full rounded-[7px] border border-blue-gray-200 bg-transparent px-3 py-2.5 font-sans text-sm font-normal text-blue-gray-700 outline outline-0 transition-all placeholder-shown:border placeholder-shown:border-blue-gray-200 placeholder-shown:border-t-blue-gray-200 focus:border-2 focus:border-pink-500 focus:border-t-transparent focus:outline-0 disabled:border-0 disabled:bg-blue-gray-50"
        ]}
      />
      <label class={[
        @variant == "static" &&  "after:content[' '] pointer-events-none absolute left-0 -top-2.5 flex h-full w-full select-none text-sm font-normal leading-tight text-blue-gray-500 transition-all after:absolute after:-bottom-2.5 after:block after:w-full after:scale-x-0 after:border-b-2 after:border-pink-500 after:transition-transform after:duration-300 peer-placeholder-shown:leading-tight peer-placeholder-shown:text-blue-gray-500 peer-focus:text-sm peer-focus:leading-tight peer-focus:text-pink-500 peer-focus:after:scale-x-100 peer-focus:after:border-pink-500 peer-disabled:text-transparent peer-disabled:peer-placeholder-shown:text-blue-gray-500",
        @variant == "standard" && "after:content[' '] pointer-events-none absolute left-0 -top-1.5 flex h-full w-full select-none text-[11px] font-normal leading-tight text-blue-gray-500 transition-all after:absolute after:-bottom-1.5 after:block after:w-full after:scale-x-0 after:border-b-2 after:border-pink-500 after:transition-transform after:duration-300 peer-placeholder-shown:text-sm peer-placeholder-shown:leading-[4.25] peer-placeholder-shown:text-blue-gray-500 peer-focus:text-[11px] peer-focus:leading-tight peer-focus:text-pink-500 peer-focus:after:scale-x-100 peer-focus:after:border-pink-500 peer-disabled:text-transparent peer-disabled:peer-placeholder-shown:text-blue-gray-500",
        @variant == "outline" && "before:content[' '] after:content[' '] pointer-events-none absolute left-0 -top-1.5 flex h-full w-full select-none text-[11px] font-normal leading-tight text-blue-gray-400 transition-all before:pointer-events-none before:mt-[6.5px] before:mr-1 before:box-border before:block before:h-1.5 before:w-2.5 before:rounded-tl-md before:border-t before:border-l before:border-blue-gray-200 before:transition-all after:pointer-events-none after:mt-[6.5px] after:ml-1 after:box-border after:block after:h-1.5 after:w-2.5 after:flex-grow after:rounded-tr-md after:border-t after:border-r after:border-blue-gray-200 after:transition-all peer-placeholder-shown:text-sm peer-placeholder-shown:leading-[3.75] peer-placeholder-shown:text-blue-gray-500 peer-placeholder-shown:before:border-transparent peer-placeholder-shown:after:border-transparent peer-focus:text-[11px] peer-focus:leading-tight peer-focus:text-pink-500 peer-focus:before:border-t-2 peer-focus:before:border-l-2 peer-focus:before:border-pink-500 peer-focus:after:border-t-2 peer-focus:after:border-r-2 peer-focus:after:border-pink-500 peer-disabled:text-transparent peer-disabled:before:border-transparent peer-disabled:after:border-transparent peer-disabled:peer-placeholder-shown:text-blue-gray-500"
      ]}>
        <%= @label %>
      </label>
    </div>
    """
  end
end
