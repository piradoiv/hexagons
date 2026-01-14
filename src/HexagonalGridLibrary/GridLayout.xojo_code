#tag Class
Protected Class GridLayout
	#tag Method, Flags = &h0
		Sub Constructor(layoutOrientation As GridLayout.Orientations, size As Point, origin As Point)
		  Var orientation As GridOrientation
		  
		  Select Case layoutOrientation
		  Case GridLayout.Orientations.Pointy
		    orientation = New GridOrientation(Sqrt(3.0), Sqrt(3.0) / 2.0, 0.0, 3.0 / 2.0, Sqrt(3.0) / 3.0, -1.0 / 3.0, 0.0, 2.0 / 3.0, 0.5)
		  Case GridLayout.Orientations.Flat
		    orientation = New GridOrientation(3.0 / 2.0, 0.0, Sqrt(3.0) / 2.0, Sqrt(3.0), 2.0 / 3.0, 0.0, -1.0 / 3.0, Sqrt(3.0) / 3.0, 0.0)
		  End Select
		  
		  Self.Orientation = orientation
		  Self.Size = size
		  Self.Origin = origin
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HexCornerOffset(corner As Integer) As Point
		  Const kPI = 3.1415926535897932384
		  
		  Var m As GridOrientation = Self.Orientation
		  Var angle As Double = 2.0 * kPI * (m.StartAngle - corner) / 6.0
		  
		  Return New Point(Size.X * Cos(angle), Size.Y * Sin(angle))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HexToPixel(h As GridHex) As Point
		  Var m As GridOrientation = Self.Orientation
		  Var x As Double = (m.F0 * h.Q + m.F1 * h.R) * Size.X
		  Var y As Double = (m.F2 * h.Q + m.F3 * h.R) * Size.Y
		  
		  Return New Point(x + Origin.X, y + Origin.Y)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PixelToHexFractional(p As Point) As GridHex
		  Var m As GridOrientation = Self.Orientation
		  
		  Var pt As Point = New Point((p.X - Origin.X) / Size.X, (p.Y - Origin.Y) / Size.Y)
		  Var q As Double = m.B0 * pt.X + m.B1 * pt.Y
		  Var r As Double = m.B2 * pt.X + m.B3 * pt.Y
		  
		  Return New GridHex(q, r, -q - r)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PixelToHexRounded(p As Point) As GridHex
		  Return PixelToHexFractional(p).Round
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PolygonCorners(h As GridHex) As Point()
		  Var result() As Point
		  var center As Point = HexToPixel(h)
		  
		  For i As Integer = 0 To 5
		    Var offset As Point = HexCornerOffset(i)
		    result.Add(New Point(center.X + offset.X, center.Y + offset.Y))
		  Next
		  
		  Return result
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Orientation As GridOrientation
	#tag EndProperty

	#tag Property, Flags = &h0
		Origin As Point
	#tag EndProperty

	#tag Property, Flags = &h0
		Size As Point
	#tag EndProperty


	#tag Enum, Name = Orientations, Type = Integer, Flags = &h0
		Pointy
		Flat
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
