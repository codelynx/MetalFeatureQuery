//
//	FeatureItems.swift
//	Metal-Feature-Query
//
//	Created by Kaz Yoshikawa on 11/19/20.
//

import Foundation
import MetalKit

let device: MTLDevice = MTLCreateSystemDefaultDevice()!

class GPUFamilyItems {
	static var shared = GPUFamilyItems()
	var items: [GPUFamilyItem] = [
		GPUFamilyItem(family: .apple1, title: "apple1"),
		GPUFamilyItem(family: .apple2, title: "apple2"),
		GPUFamilyItem(family: .apple3, title: "apple3"),
		GPUFamilyItem(family: .apple4, title: "apple4"),
		GPUFamilyItem(family: .apple5, title: "apple5"),
		GPUFamilyItem(family: .apple6, title: "apple6"),
		GPUFamilyItem(family: .apple7, title: "apple7")
	]
}

struct GPUFamilyItem: Identifiable {
	let id = UUID()
	let family: MTLGPUFamily
	let title: String
	var supports: Bool { device.supportsFamily(self.family) }
}


class GPUFeatureSets {
	static var shared = GPUFeatureSets()
	var items: [GPUFeatureSetItem] = [
		GPUFeatureSetItem(featureSet: .iOS_GPUFamily1_v1, title: "iOS_GPUFamily1_v1"),
		GPUFeatureSetItem(featureSet: .iOS_GPUFamily1_v2, title: "iOS_GPUFamily1_v2"),
		GPUFeatureSetItem(featureSet: .iOS_GPUFamily1_v3, title: "iOS_GPUFamily1_v3"),
		GPUFeatureSetItem(featureSet: .iOS_GPUFamily1_v4, title: "iOS_GPUFamily1_v4"),
		GPUFeatureSetItem(featureSet: .iOS_GPUFamily1_v5, title: "iOS_GPUFamily1_v5"),

		GPUFeatureSetItem(featureSet: .iOS_GPUFamily2_v1, title: "iOS_GPUFamily2_v1"),
		GPUFeatureSetItem(featureSet: .iOS_GPUFamily2_v2, title: "iOS_GPUFamily2_v2"),
		GPUFeatureSetItem(featureSet: .iOS_GPUFamily2_v3, title: "iOS_GPUFamily2_v3"),
		GPUFeatureSetItem(featureSet: .iOS_GPUFamily2_v4, title: "iOS_GPUFamily2_v4"),
		GPUFeatureSetItem(featureSet: .iOS_GPUFamily2_v5, title: "iOS_GPUFamily2_v5"),

		GPUFeatureSetItem(featureSet: .iOS_GPUFamily3_v1, title: "iOS_GPUFamily3_v1"),
		GPUFeatureSetItem(featureSet: .iOS_GPUFamily3_v2, title: "iOS_GPUFamily3_v2"),
		GPUFeatureSetItem(featureSet: .iOS_GPUFamily3_v3, title: "iOS_GPUFamily3_v3"),
		GPUFeatureSetItem(featureSet: .iOS_GPUFamily3_v4, title: "iOS_GPUFamily3_v4"),

		GPUFeatureSetItem(featureSet: .iOS_GPUFamily4_v1, title: "iOS_GPUFamily4_v1"),
		GPUFeatureSetItem(featureSet: .iOS_GPUFamily4_v2, title: "iOS_GPUFamily4_v2"),

		GPUFeatureSetItem(featureSet: .iOS_GPUFamily5_v1, title: "iOS_GPUFamily5_v1"),
	]
}

struct GPUFeatureSetItem: Identifiable {
	let id = UUID()
	let featureSet: MTLFeatureSet
	let title: String
	var supports: Bool { device.supportsFeatureSet(self.featureSet) }
}


class DeviceAttributes {
	static var shared = DeviceAttributes()
	var items: [DeviceAttributeItem] {
		[
			DeviceAttributeItem(title: "Platform", value: { UIDevice.current.platform }),
			DeviceAttributeItem(title: "Model", value: { UIDevice.current.model }),
			DeviceAttributeItem(title: "Environment", value: { DeviceAttributes.environment })
		]
	}
	static var environment: String {
		#if targetEnvironment(simulator)
		return "Simulator"
		#elseif targetEnvironment(macCatalyst)
		return "Mac Catalyst"
		#elseif os(iOS)
		return "iOS"
		#elseif os(macOS)
		return "macOS"
		#else
		return "?"
		#endif
	}
}

struct DeviceAttributeItem: Identifiable {
	let id = UUID()
	let title: String
	let value: (() -> String)
}

