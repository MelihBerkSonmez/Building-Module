--Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--Definations
local Modules = ReplicatedStorage:WaitForChild("Modules")
local Model = workspace:WaitForChild("House")

--Module/s
local CustomBuilderModule = require(Modules["iyiinsan5555's_CustomBuilderModule"])

CustomBuilderModule.MakeModelReadyForBuild(Model)

task.wait(5)

CustomBuilderModule.Build(CustomBuilderModule.BuildingModes.RotationAnimation, Model, 0, nil )

