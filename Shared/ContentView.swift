//
//	ContentView.swift
//	Shared
//
//	Created by Kaz Yoshikawa on 11/19/20.
//

import SwiftUI
import MetalKit

struct ContentView: View {
	var body: some View {
		NavigationView {
			List {
				Section(header: Text("Device")) {
					ForEach(DeviceAttributes.shared.items) { item in
						DeviceAttributeItemCell(item: item)
					}
				}
				Section(header: Text("GPU Family")) {
					ForEach(GPUFamilyItems.shared.items) { item in
						FamilyItemCell(item: item)
					}
				}
				Section(header: Text("Feature Set")) {
					ForEach(GPUFeatureSets.shared.items) { item in
						FeatureSetItemCell(item: item)
					}
				}
			}
			.listStyle(GroupedListStyle())
			.navigationBarTitle("Querying Metal Feature Set", displayMode: .automatic) // automatic, inline
			/*
			.navigationBarItems(trailing: Button(action: {
			}, label: {
				Text("Copy")
			}))
			*/
		}
		.navigationViewStyle(StackNavigationViewStyle()) // DefaultNavigationViewStyle, StackNavigationViewStyle
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}

struct FamilyItemCell: View {
	var item: GPUFamilyItem
	var body: some View {
		HStack {
			Text(item.title)
			Spacer()
			self.image
		}
	}
	var image: Image {
		Image(systemName: item.supports ? "checkmark.square" : "square")
	}
}

struct FeatureSetItemCell: View {
	var item: GPUFeatureSetItem
	var body: some View {
		HStack {
			Text(item.title)
			Spacer()
			self.image
		}
	}
	var image: Image {
		Image(systemName: item.supports ? "checkmark.square" : "square")
	}
}

struct DeviceAttributeItemCell: View {
	var item: DeviceAttributeItem
	var body: some View {
		HStack {
			Text(item.title)
			Spacer()
			Text(item.value())
		}
	}
}
