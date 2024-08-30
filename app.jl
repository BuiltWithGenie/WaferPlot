module App
# == Packages ==
# set up Genie development environment. Use the Package Manager to install new packages
using GenieFramework, DelimitedFiles, StippleWaferPlot
@genietools

# convert matrix to vector of vectors
Stipple.render(X::Matrix) = [X[:, i] for i in 1:size(X, 2)]

# == Reactive code ==
# add reactive code to make the UI interactive
@app begin
    # == Reactive variables ==
    # reactive variables exist in both the Julia backend and the browser with two-way synchronization
    # @out variables can only be modified by the backend
    # @in variables can be modified by both the backend and the browser
    # variables must be initialized with constant values, or variables defined outside of the @app block
    # @out wafer_data = rand(10,10)
    # @out wafer_angle = 2.0*ones(10,10)
    # @in selected_cell = [0,0]
    # @in N = 10
    # @in angle = 0.0
    # @in magnitude = 0.1
    # @in animate = false
    # file saving and loading
    # @in save = false
    # @in filename = "data"
    # @in selected_file = "" 
    # @out data_files = string.(unique([ split(f, "_")[1] for f in readdir("data")]))

    # == Reactive handlers ==
    # reactive handlers watch a variable and execute a block of code when
    # its value changes
    # @onchange N begin
    #     wafer_data = magnitude*rand(N,N)
    #     wafer_angle = angle*ones(N,N)
    # end
    # @onchange magnitude begin
    #     wafer_data = magnitude * rand(N,N)
    # end
    # @onchange angle begin
    #     wafer_angle = angle*ones(N,N)
    # end
    # the onbutton handler will set the variable to false after the block is executed
    # @onbutton animate begin
    #     angle = 0.0
    #     magnitude = 0
    #     for N in 10:20
    #         angle += 0.6
    #         magnitude += 0.3
    #         sleep(0.5)
    #     end
    # end

    # @onbutton save begin
    #     DelimitedFiles.writedlm("data/$(filename)_mag.csv", wafer_data, ",")
    #     DelimitedFiles.writedlm("data/$(filename)_angle.csv", wafer_angle, ",")
    #     data_files = string.(unique([ split(f, "_")[1] for f in readdir("data")]))
    #     @show data_files
    # end

    # @onchange selected_file begin
    #     wafer_data = DelimitedFiles.readdlm("data/$(selected_file)_mag.csv", ',' , Float64)
    #     wafer_angle = DelimitedFiles.readdlm("data/$(selected_file)_angle.csv", ',' , Float64)
    # end

    
end

# == Pages ==
# register a new route and the page that will be loaded on access
@page("/", "app.jl.html")
end
