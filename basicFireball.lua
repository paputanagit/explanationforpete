```lua 
-- การทำงานของ Variables คือสร้างที่เก็บข้อมูลไว้ตามชื่อที่ตั้งแล้วเมื่อตั้งเป็นข้อมูลใดไป Variables จะกลายเป็นสิ่งนั้น
-- Variables สามารถถูกเปลี่ยนแปลงได้โดยการพิมชื่อของ Variable แล้วกำหนดค่าใหม่ 
-- สมมติ local NumberOfApples = 1 เวลาจะเปลี่ยนเป็น 5 ก็พิม NumberOfApples = 5 ค่าของ NumberOfApples ก็จะกลายเป็น 5

local ToolVariable = script.Parent -- สร้างตัวแปรที่มีชื่อว่า ToolVariable โดยตั้งให้ตัวแปรนี้เป็น Tool ที่อยู่บน script นี้ (Parent ของ script คือ Tool)

function ToolsActivated() -- สร้าง function ที่ชื่อ ToolsActivated โดยมีจุดมุ่งหมายคือเวลากดแล้ว Function นี้จะทำงาน
	local Charac = ToolVariable.Parent -- สร้างตัวแปรที่มีชื่อว่า Charac โดยกำหนดให้มันเป็นสิ่งที่อยู่ด้านบนตัวแปร ToolVariable (Tool ที่อยู่ด้านบน script) 
	-- ซึ่งเวลา function ทำงานหรือก็คือตอนที่กดใช้ Tool ตัวของ Tool นั้นจะอยู่ในตัว Character ของผู้เล่นทำให้ ToolVariable.Parent เป็นตัว Character ของผู้เล่น
	
	local learn = Instance.new("Part") -- สร้างตัวแปรโดยให้ตัวแปรเป็น Part ใหม่
	-- Instance คือสิ่งของแต่ละอย่างในเกม (ยกตัวอย่าง : Tool, Part, Workspace, Attachment)
	-- Instance.new() คือการสร้างของชิ้นใหม่ในเกมโดยการทำงานของมันคือเมื่อใส่ string ที่ตรงกับชื่อ Instance นั้นๆไปเราก็จะสร้างมันออกมา (Ex: Instance.new("Part"), Instance.new("Attachment"))
	
	learn.Size = Vector3.new(3,3,3) -- ปรับSizeของสิ่งที่เราจะสร้างหรือปล่อยออกมา Vector3คือตัวแทนของแกนX,Y,Z (ถูกต้องแล้วน้าบบบ!!!!)
	learn.Shape = "Block" -- ปรับรูปทรงของที่สิ่งที่จะปล่อยออกมาในที่นี้คือBlock (ถูกต้องแล้วน้าบบบ!!!!)
	-- ถ้าเขียนแค่นี้จะแล้วใช้Toolจะไม่มีอะไรเกิดขึ้นเนื่องจากมันยังไม่มีที่อยู่(Parentของมัน) (ถูกต้องแล้วน้าบบบ!!!!)
	
	learn.Parent = workspace -- ให้ที่อยู่ของlearn(ขอที่จะปล่อยออกไป)ในที่นี้คือworkspace (ถูกต้องแล้วน้าบบบ!!!!)
	--ถ้าอยากให้พุ่งต้องใส่BodyVelocityให้มันมีวิธีอื่นอีกมั้ยกูไม่รู้ไอ้ฟักซามุไม่ได้สอนกู (ถูกต้องแล้วน้าบบบ!!!!)

	
	local Speed = Instance.new("BodyVelocity") -- สร้างตัวแปรที่ชื่อSpeed ให้สร้างBodyVelocityขึ้นมาโดยการInstance.newเหมือนเดิมแต่ในที่นี้คือBodyVelocity ไม่ใช่part (ถูกต้องแล้วน้าบบบ!!!!)
	Speed.MaxForce = Vector3.new (1/0,1/0,1/0) -- สร้างMaxForce ขึ้นเพื่อกำหนดสปีดตันของpart ที่จะปล่อยไปโดยใช้Vector3เหมือนเดิม (ถูกต้องแล้วน้าบบบ!!!!)
	Speed.Velocity = Charac.HumanoidRootPart.CFrame.LookVector * 60 -- ในเมื่อ Velocity ของตัวแปร Speed ต้องการความไวและทิศทางที่มันต้องหันไปเป็นแบบ Vector3 เราจึงต้องใช้ทิศทางที่หันไป (CFrame.LookVector) คูณกับ ความไว (60) 
	-- ใน CFrame มีค่าที่ชื่อว่า LookVector อยู่ซึ่งคือค่าที่บ่งบอกถึงทิศทางที่ CFrame นั้นหันไปอยู่โดยเป็นค่า Vector3
	
	-- ถ้ารันสคริปตอนนี้partก็จะยังไม่พุ่งไปเนื่องจากBodyVelocity ยังไม่มีParentดังนั้นเราต้องหา Parentให้มันก่อน
	-- *บรรทัดที่30*
	
	Speed.Parent = learn -- ยัดParent ให้BodyVelocity ในที่นี้คือPartที่เราจะปล่อยไป(learn)มันจะได้พุ่งไป yessir หรือพูดง่ายๆคือเอาความไวไปใส่ใน part (learn)

end -- จบการทำงานของ function

-- การทำงาน + วิธีเรียกใช้งานของ Event 
-- Event คือเหตุการณ์ของสิ่งของนั้นๆที่จะรันทุกครั้งที่เกิดเหตุการณ์นั้นขึ้น
-- ใช้วิธีแบบเดียวกับการลงไปหา Properties หรือว่าการลงเข้าไปหา Child (Child คือสิ่งที่อยู่ใต้ของนั้นๆชั้นเดียว เช่น script นี้เป็น Child ของ NewTool) ซึ่งใช้ .
-- Event นั้นๆจะทำงานเมื่อตรงกับเหตุการณ์ที่มันตั้งไว้ยกตัวอย่าง Event .Touched ของ Part เมื่อเราแตะ Part นั้น Event ก็จะทำงาน
-- แต่ Event นั้นต้องใช้ Method เพื่อบอกให้มันทำอะไรเมื่อเกิดเหตุการณ์นั้นๆขึ้น เช่น :Wait() (รอจนกว่าเหตุการณ์นี้จะเกิดขึ้น) หรือ :Connect() (เชื่อมกับ function นี้)

ToolVariable.Activated:Connect(ToolsActivated) -- เมื่อ ToolVariable(ตัว Tool ที่อยู่เหนือ script นี้) ถูกกดจะถูกเชื่อมให้ function ToolsActivated ทำงาน  
-- สีห่าแม่งมึงหน้อ --
```
