--Services
local TweenService = game:GetService("TweenService")

--Definations

--Functions
local function CreateSortedTableFromModel(Model :Model)

    local Table = {
        BaseParts = {},
    }

    for _, Thing in pairs(Model:GetDescendants()) do
        if Thing:IsA("BasePart") then
           table.insert(Table.BaseParts, Thing)
        end
    end

    table.sort(Table.BaseParts, function(a, b)
        return a.Position.Y < b.Position.Y
    end)

    return Table

end

local function AfterAnimatingBasePart(BasePart :BasePart)
    
    if not BasePart:IsA("BasePart") then
        return
    end

    BasePart.CanCollide = true

end


local CustomBuilderModule = {}

CustomBuilderModule.BuildingModes = {
    ClassicFadeOut = "ClassicFadeOut",
    ComesFromRandomPosition = "ComesFromRandomPosition",
    ComesFromRandomPositionWithFade = "ComesFromRandomPositionWithFade",
    GrowthAnimation = "GrowthAnimation",
    GrowthAnimationWithFade = "GrowthAnimationWithFade",
    HorizontalAnimation = "HorizontalAnimation",
    VerticalAnimation = "VerticalAnimation",
    ComesFromCenter = "ComesFromCenter",
    ComesFromCenterWithFade = "ComesFromCenterWithFade",
    ComesFromUp = "ComesFromUp",
    ComesFromUpWithFade = "ComesFromUpWithFade",
    ColorChange = "ColorChange",
    RotationAnimation = "RotationAnimation",

}

CustomBuilderModule.Settings = {

    ComesFromUp = {
        HeightAmount = 50
    },

    ColorChange = {
        StartColor = Color3.fromRGB(255,255,255)
    }

}

function CustomBuilderModule.MakeModelReadyForBuild(Model :Model)

    for _, Thing in pairs(Model:GetDescendants()) do

        if Thing:IsA("BasePart") then
            Thing.Transparency = 1
            Thing.CanCollide = false
        end

    end

end

function  CustomBuilderModule.Build(BuildingMode :string, Model :Model, WaitTimeBetweenEachPart :number, CustomTweenInfo :TweenInfo)

    if CustomBuilderModule.BuildingModes[BuildingMode] then
        CustomBuilderModule[BuildingMode](Model, WaitTimeBetweenEachPart, CustomTweenInfo)
    end
    
end


function CustomBuilderModule.ClassicFadeOut(Model :Model, WaitTimeBetweenEachPart :number, CustomTweenInfo :TweenInfo)

    local ThingsTable = CreateSortedTableFromModel(Model)

    local Tween_Info = CustomTweenInfo or TweenInfo.new(0.25,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0)

    CustomBuilderModule.MakeModelReadyForBuild(Model)

    for _, BasePart :BasePart in pairs(ThingsTable.BaseParts) do
        
        local Tween = TweenService:Create(BasePart, Tween_Info, {Transparency = 0})
        Tween:Play()

        AfterAnimatingBasePart(BasePart)

        if WaitTimeBetweenEachPart then
            task.wait(WaitTimeBetweenEachPart)
        end

    end
    
end


function CustomBuilderModule.ComesFromRandomPosition(Model :Model, WaitTimeBetweenEachPart :number, CustomTweenInfo :TweenInfo)

    local ThingsTable = CreateSortedTableFromModel(Model)

    local Tween_Info = CustomTweenInfo or TweenInfo.new(0.25,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0)

    CustomBuilderModule.MakeModelReadyForBuild(Model)

    for _, BasePart :BasePart in pairs(ThingsTable.BaseParts) do

        local GoalCFrame = BasePart.CFrame
        local RandomCFrame = CFrame.new(GoalCFrame:PointToWorldSpace(Vector3.new(math.random(-30,30), math.random(15,40), math.random(-30,30)))) * CFrame.Angles(math.rad(math.random(5,20)), math.rad(math.random(5,20)), math.rad(math.random(5,20)))

        BasePart.CFrame = RandomCFrame
        BasePart.Transparency = 0
        
        local Tween = TweenService:Create(BasePart, Tween_Info, {CFrame = GoalCFrame })
        Tween:Play()

        AfterAnimatingBasePart(BasePart)

        if WaitTimeBetweenEachPart then
            task.wait(WaitTimeBetweenEachPart)
        end

    end
    
end


function CustomBuilderModule.ComesFromRandomPositionWithFade(Model :Model, WaitTimeBetweenEachPart :number, CustomTweenInfo :TweenInfo)

    local ThingsTable = CreateSortedTableFromModel(Model)

    local Tween_Info = CustomTweenInfo or TweenInfo.new(0.25,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0)

    CustomBuilderModule.MakeModelReadyForBuild(Model)

    for _, BasePart :BasePart in pairs(ThingsTable.BaseParts) do

        local GoalCFrame = BasePart.CFrame
        local RandomCFrame = CFrame.new(GoalCFrame:PointToWorldSpace(Vector3.new(math.random(-20,20), math.random(15,40), math.random(-20,20)))) * CFrame.Angles(math.rad(math.random(5,20)), math.rad(math.random(5,20)), math.rad(math.random(5,20)))

        BasePart.CFrame = RandomCFrame
        
        local Tween = TweenService:Create(BasePart, Tween_Info, {Transparency = 0, CFrame = GoalCFrame })
        Tween:Play()

        AfterAnimatingBasePart(BasePart)

        if WaitTimeBetweenEachPart then
            task.wait(WaitTimeBetweenEachPart)
        end

    end
    
end



function CustomBuilderModule.GrowthAnimation(Model :Model, WaitTimeBetweenEachPart :number, CustomTweenInfo :TweenInfo)

    local ThingsTable = CreateSortedTableFromModel(Model)

    local Tween_Info = CustomTweenInfo or TweenInfo.new(0.25,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0)

    CustomBuilderModule.MakeModelReadyForBuild(Model)

    for _, BasePart :BasePart in pairs(ThingsTable.BaseParts) do

        local GoalSize = BasePart.Size
        local RandomSize = Vector3.new(GoalSize.X / math.random(1,20), GoalSize.Y / math.random(1,20), GoalSize.Z / math.random(1,20))

        BasePart.Size = RandomSize
        BasePart.Transparency = 0
        
        local Tween = TweenService:Create(BasePart, Tween_Info, {Size = GoalSize })
        Tween:Play()

        AfterAnimatingBasePart(BasePart)

        if WaitTimeBetweenEachPart then
            task.wait(WaitTimeBetweenEachPart)
        end

    end
end

function CustomBuilderModule.GrowthAnimationWithFade(Model :Model, WaitTimeBetweenEachPart :number, CustomTweenInfo :TweenInfo)

    local ThingsTable = CreateSortedTableFromModel(Model)

    local Tween_Info = CustomTweenInfo or TweenInfo.new(0.25,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0)

    CustomBuilderModule.MakeModelReadyForBuild(Model)

    for _, BasePart :BasePart in pairs(ThingsTable.BaseParts) do

        local GoalSize = BasePart.Size
        local RandomSize = Vector3.new(GoalSize.X / math.random(1,20), GoalSize.Y / math.random(1,20), GoalSize.Z / math.random(1,20))

        BasePart.Size = RandomSize
        
        local Tween = TweenService:Create(BasePart, Tween_Info, {Size = GoalSize, Transparency = 0 })
        Tween:Play()

        AfterAnimatingBasePart(BasePart)

        if WaitTimeBetweenEachPart then
            task.wait(WaitTimeBetweenEachPart)
        end

    end
end


function CustomBuilderModule.HorizontalAnimation(Model :Model, WaitTimeBetweenEachPart :number, CustomTweenInfo :TweenInfo)

    local ThingsTable = CreateSortedTableFromModel(Model)

    local Tween_Info = CustomTweenInfo or TweenInfo.new(0.25,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0)

    CustomBuilderModule.MakeModelReadyForBuild(Model)

    for _, BasePart :BasePart in pairs(ThingsTable.BaseParts) do

        local GoalCFrame = BasePart.CFrame
        local RandomCFrame = BasePart.CFrame:ToWorldSpace(CFrame.new(math.random(10,20),0,0))

        BasePart.CFrame = RandomCFrame
        
        local Tween = TweenService:Create(BasePart, Tween_Info, {CFrame = GoalCFrame, Transparency = 0})
        Tween:Play()

        AfterAnimatingBasePart(BasePart)

        if WaitTimeBetweenEachPart then
            task.wait(WaitTimeBetweenEachPart)
        end

    end
end

function CustomBuilderModule.VerticalAnimation(Model :Model, WaitTimeBetweenEachPart :number, CustomTweenInfo :TweenInfo)

    local ThingsTable = CreateSortedTableFromModel(Model)

    local Tween_Info = CustomTweenInfo or TweenInfo.new(0.25,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0)

    CustomBuilderModule.MakeModelReadyForBuild(Model)

    for _, BasePart :BasePart in pairs(ThingsTable.BaseParts) do

        local GoalCFrame = BasePart.CFrame
        local RandomCFrame = BasePart.CFrame:ToWorldSpace(CFrame.new(0,math.random(10,20),0))

        BasePart.CFrame = RandomCFrame
        
        local Tween = TweenService:Create(BasePart, Tween_Info, {CFrame = GoalCFrame, Transparency = 0})
        Tween:Play()

        AfterAnimatingBasePart(BasePart)

        if WaitTimeBetweenEachPart then
            task.wait(WaitTimeBetweenEachPart)
        end

    end
end

function CustomBuilderModule.ComesFromCenter(Model: Model, WaitTimeBetweenEachPart: number, CustomTweenInfo: TweenInfo)

    local ThingsTable = CreateSortedTableFromModel(Model)

    local Tween_Info = CustomTweenInfo or TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)

    CustomBuilderModule.MakeModelReadyForBuild(Model)
    
    local CenterBasePart = ThingsTable.BaseParts[1]
    local CenterCFrame = CenterBasePart.CFrame
    
    for _, BasePart in pairs(ThingsTable.BaseParts) do

        local GoalCFrame = BasePart.CFrame

        local RandomizedAngleCFrame = CFrame.Angles(math.random(math.rad(-100),math.rad(100)),math.random(math.rad(-100),math.rad(100)),math.random(math.rad(-100),math.rad(100)))

        BasePart.CFrame = CenterCFrame * RandomizedAngleCFrame
        BasePart.Transparency = 0

        local Tween = TweenService:Create(BasePart, Tween_Info, {CFrame = GoalCFrame})
        Tween:Play()

        AfterAnimatingBasePart(BasePart)
        
        if WaitTimeBetweenEachPart then
            task.wait(WaitTimeBetweenEachPart)
        end

    end
end

function CustomBuilderModule.ComesFromCenterWithFade(Model: Model, WaitTimeBetweenEachPart: number, CustomTweenInfo: TweenInfo)

    local ThingsTable = CreateSortedTableFromModel(Model)

    local Tween_Info = CustomTweenInfo or TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)

    CustomBuilderModule.MakeModelReadyForBuild(Model)
    
    local CenterBasePart = ThingsTable.BaseParts[1]
    local CenterCFrame = CenterBasePart.CFrame
    
    for _, BasePart in pairs(ThingsTable.BaseParts) do

        local GoalCFrame = BasePart.CFrame

        local RandomizedAngleCFrame = CFrame.Angles(math.random(math.rad(-100),math.rad(100)),math.random(math.rad(-100),math.rad(100)),math.random(math.rad(-100),math.rad(100)))
        BasePart.CFrame = CenterCFrame * RandomizedAngleCFrame

        local Tween = TweenService:Create(BasePart, Tween_Info, {Transparency = 0, CFrame = GoalCFrame})
        Tween:Play()

        AfterAnimatingBasePart(BasePart)
        
        if WaitTimeBetweenEachPart then
            task.wait(WaitTimeBetweenEachPart)
        end

    end
end

function CustomBuilderModule.ComesFromUp(Model: Model, WaitTimeBetweenEachPart: number, CustomTweenInfo: TweenInfo)

    local ThingsTable = CreateSortedTableFromModel(Model)

    local Tween_Info = CustomTweenInfo or TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)

    CustomBuilderModule.MakeModelReadyForBuild(Model)
    
    for _, BasePart in pairs(ThingsTable.BaseParts) do

        local GoalCFrame = BasePart.CFrame
        local UpCFrame = GoalCFrame:ToWorldSpace(CFrame.new(Vector3.new(0, CustomBuilderModule.Settings.ComesFromUp.HeightAmount, 0)))

        BasePart.Transparency = 0
        BasePart.CFrame = UpCFrame

        local Tween = TweenService:Create(BasePart, Tween_Info, {CFrame = GoalCFrame})
        Tween:Play()
        
        AfterAnimatingBasePart(BasePart)

        if WaitTimeBetweenEachPart then
            task.wait(WaitTimeBetweenEachPart)
        end

    end
end


function CustomBuilderModule.ComesFromUpWithFade(Model: Model, WaitTimeBetweenEachPart: number, CustomTweenInfo: TweenInfo)

    local ThingsTable = CreateSortedTableFromModel(Model)

    local Tween_Info = CustomTweenInfo or TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)

    CustomBuilderModule.MakeModelReadyForBuild(Model)
    
    for _, BasePart in pairs(ThingsTable.BaseParts) do

        local GoalCFrame = BasePart.CFrame
        local UpCFrame = GoalCFrame:ToWorldSpace(CFrame.new(Vector3.new(0, CustomBuilderModule.Settings.ComesFromUp.HeightAmount, 0)))

        BasePart.CFrame = UpCFrame

        local Tween = TweenService:Create(BasePart, Tween_Info, {Transparency = 0, CFrame = GoalCFrame})
        Tween:Play()

        AfterAnimatingBasePart(BasePart)
        
        if WaitTimeBetweenEachPart then
            task.wait(WaitTimeBetweenEachPart)
        end

    end
end

function CustomBuilderModule.ColorChange(Model: Model, WaitTimeBetweenEachPart: number, CustomTweenInfo: TweenInfo)

    local ThingsTable = CreateSortedTableFromModel(Model)

    local Tween_Info = CustomTweenInfo or TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)

    CustomBuilderModule.MakeModelReadyForBuild(Model)
    
    for _, BasePart in pairs(ThingsTable.BaseParts) do

        local GoalColor = BasePart.Color

        BasePart.Color = CustomBuilderModule.Settings.ColorChange.StartColor

        local Tween = TweenService:Create(BasePart, Tween_Info, {Color = GoalColor, Transparency = 0})
        Tween:Play()

        AfterAnimatingBasePart(BasePart)
        
        if WaitTimeBetweenEachPart then
            task.wait(WaitTimeBetweenEachPart)
        end

    end
end

function CustomBuilderModule.RotationAnimation(Model: Model, WaitTimeBetweenEachPart: number, CustomTweenInfo: TweenInfo)

    local ThingsTable = CreateSortedTableFromModel(Model)

    local Tween_Info = CustomTweenInfo or TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)

    CustomBuilderModule.MakeModelReadyForBuild(Model)
    
    for _, BasePart in pairs(ThingsTable.BaseParts) do

        local GoalCFrame = BasePart.CFrame
        local RotatedCFrame = GoalCFrame * CFrame.Angles(math.random(math.rad(-360),math.rad(360)),math.random(math.rad(-360),math.rad(360)),math.random(math.rad(-360),math.rad(360)))

        BasePart.CFrame = RotatedCFrame

        local Tween = TweenService:Create(BasePart, Tween_Info, {CFrame = GoalCFrame, Transparency = 0})
        Tween:Play()

        AfterAnimatingBasePart(BasePart)
        
        if WaitTimeBetweenEachPart then
            task.wait(WaitTimeBetweenEachPart)
        end

    end
end

return CustomBuilderModule