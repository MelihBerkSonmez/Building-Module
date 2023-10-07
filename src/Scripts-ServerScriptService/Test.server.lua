--Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--Definations
local Modules = ReplicatedStorage:WaitForChild("Modules")
local Model = workspace:WaitForChild("House")

--Module/s
local CustomBuilderModule = require(Modules["iyiinsan5555's_CustomBuilderModule"])

CustomBuilderModule.MakeModelReadyForBuild(Model)

task.wait(3)

CustomBuilderModule.Build(CustomBuilderModule.BuildingModes.VerticalAnimation, Model, 0, nil )

