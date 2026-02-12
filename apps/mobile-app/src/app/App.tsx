import React from 'react';
import { View, Text, StatusBar } from 'react-native';
import "../../global.css";

export default function App() {
  return (
    <View className="flex-1 bg-cultivar-50 items-center justify-center">
      <StatusBar barStyle="dark-content" />
      <View className="p-6 bg-white rounded-2xl shadow-xl border border-cultivar-100">
        <Text className="text-3xl font-bold text-cultivar-700 mb-2">
          Cultivar IA 🌿
        </Text>
        <Text className="text-gray-600 text-center">
          Tu asistente de cultivo inteligente.
        </Text>
      </View>
    </View>
  );
}
