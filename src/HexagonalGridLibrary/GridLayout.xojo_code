#tag Class
Protected Class GridLayout
	#tag Method, Flags = &h0
		Sub Constructor(orientation As GridOrientation, size As Point, origin As Point)
		  Self.Orientation = orientation
		  Self.Size = size
		  Self.Origin = origin
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Flat() As GridOrientation
		  Return New GridOrientation(3.0 / 2.0, 0.0, Sqrt(3.0) / 2.0, Sqrt(3.0), 2.0 / 3.0, 0.0, -1.0 / 3.0, Sqrt(3.0) / 3.0, 0.0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HexCornerOffset(corner As Integer) As Point
		  Const kPI = 3.1415926535897932384
		  
		  Var m As GridOrientation = Self.Orientation
		  Var angle As Integer = 2.0 * kPI * (m.StartAngle - corner) / 6.0
		  
		  Return New Point(Size.X * Cos(angle), Size.Y * Sin(angle))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HexToPixel(h As GridHex) As Point
		  Var m As GridOrientation = Self.Orientation
		  Var x As Integer = (m.F0 * h.Q + m.F1 * h.R) * Size.X
		  Var y As Integer = (m.F2 * h.Q + m.F3 * h.R) * Size.Y
		  
		  Return New Point(x + Origin.X, y + Origin.Y)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PixelToHexFractional(p As Point) As GridHex
		  Var m As GridOrientation = Self.Orientation
		  
		  Var pt As Point = New Point((p.X - Origin.X) / Size.X, (p.Y - Origin.Y) / Size.Y)
		  Var q As Integer = m.B0 * pt.X + m.B1 * pt.Y
		  Var r As Integer = m.B2 * pt.X + m.B3 * pt.Y
		  
		  Return New GridHex(q, r, -q - r)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PixelToHexRounded(p As Point) As GridHex
		  Return PixelToHexFractional(p).Round
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Pointy() As GridOrientation
		  Return New GridOrientation(Sqrt(3.0), Sqrt(3.0) / 2.0, 0.0, 3.0 / 2.0, Sqrt(3.0) / 3.0, -1.0 / 3.0, 0.0, 2.0 / 3.0, 0.5)
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
		#tag ViewProperty
			Name="Orientation"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
