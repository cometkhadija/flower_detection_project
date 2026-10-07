# 🌸 Flora Identify

**An Offline Deep Learning-Based Flower Identification App with Medicinal, Skincare, and Cultivation Information**

Flora Identify is a lightweight Android application that uses **deep learning and TensorFlow Lite** to identify flowers from images directly on a mobile device.

The project combines an image classification model with a local flower information system, allowing users to identify flowers and explore their **medicinal properties, skincare applications, and cultivation guidance** without requiring an internet connection.

The underlying research uses **MobileNetV2 with transfer learning**, selected for its balance between recognition performance and computational efficiency for mobile deployment.

---

## ✨ Key Features

* 🌺 **Flower Identification** from camera or gallery images
* 🤖 **Deep Learning-based classification** using MobileNetV2
* 📱 **On-device inference** using TensorFlow Lite
* 📴 **Fully offline operation**
* 💊 **Medicinal properties** of identified flowers
* 🧴 **Skincare benefits and applications**
* 🌱 **Cultivation guidance**
* 🌐 Flower information available in **English and Bengali**
* ⚡ Lightweight model designed for mobile environments

---

## 🧠 Deep Learning Model

The flower classification system uses **MobileNetV2**, initialized with ImageNet pretrained weights.

The classification head consists of:

```text
MobileNetV2 (ImageNet)
        ↓
Global Average Pooling
        ↓
Dense Layer (128 units, ReLU)
        ↓
Dropout
        ↓
Softmax Output
        ↓
26 Flower Classes
```

### Training Strategy

Training was performed in two stages:

**Stage 1 — Transfer Learning**

* MobileNetV2 backbone kept frozen
* Only the newly added classification head was trained
* Validation Accuracy: **94.00%**

**Stage 2 — Fine-Tuning**

* MobileNetV2 backbone was unfrozen
* Entire network was fine-tuned
* Validation Accuracy: **93.20%**

Since fine-tuning resulted in a slight decrease in validation performance, the **frozen-backbone model achieving 94.00% validation accuracy was selected for deployment**.

---

## 📊 Dataset

The final dataset contains:

| Property              | Details                          |
| --------------------- | -------------------------------- |
| Total Images          | **7,989**                        |
| Flower Categories     | **26**                           |
| Training / Validation | Approximately **80 / 20**        |
| Task                  | Multi-class image classification |

The dataset contains images from 26 different flower categories and was prepared for training a mobile-oriented flower classification model.

---

## 📈 Model Performance

The selected MobileNetV2 model achieved:

| Model           | Validation Accuracy |
| --------------- | ------------------: |
| **MobileNetV2** |          **94.00%** |
| ResNet50        |              96.15% |
| DenseNet121     |              94.29% |
| InceptionV3     |              90.75% |
| VGG16           |              84.29% |

Although some larger architectures achieved higher classification accuracy, **MobileNetV2 was selected because the project prioritizes mobile deployment and computational efficiency**, providing a strong balance between recognition performance and resource requirements.

> **Note:** The reported accuracy is validation performance on the prepared dataset and should not be interpreted as guaranteed real-world accuracy for every photograph or flower species.

---

## 📱 Application

The trained model was converted to **TensorFlow Lite (TFLite)** and integrated into an Android application.

The application workflow is:

```text
Camera / Gallery
       ↓
Input Image
       ↓
Image Preprocessing
       ↓
TensorFlow Lite Model
       ↓
Flower Prediction
       ↓
Flower Information
       ├── Medicinal Properties
       ├── Skincare Benefits
       └── Cultivation Guidance
```

Because the model is executed locally on the device, the core identification functionality does not require an internet connection.

---

## 🛠️ Technology Stack

### Machine Learning

* Python
* TensorFlow / Keras
* MobileNetV2
* Transfer Learning
* Image Classification
* TensorFlow Lite

### Mobile Application

* Flutter
* Dart
* TensorFlow Lite
* Local JSON-based flower information

### Development Tools

* Google Colab / Python environment
* Android Studio
* Flutter SDK
* Git & GitHub

---

## 📂 Project Structure

```text
flower_detection_project/
│
├── android/
├── ios/
├── lib/
│   ├── core/
│   ├── models/
│   ├── screens/
│   │   ├── home/
│   │   ├── result/
│   │   └── details/
│   ├── services/
│   ├── utils/
│   └── widgets/
│
├── assets/
│   ├── images/
│   ├── icons/
│   ├── flower_model_26classes.tflite
│   └── flower_data_26.json
│
├── web/
├── windows/
├── linux/
├── macos/
├── test/
│
├── pubspec.yaml
└── README.md
```

---

## 🚀 Getting Started

### Prerequisites

Make sure you have the following installed:

* Flutter SDK
* Dart SDK
* Android Studio
* Android SDK
* A physical Android device or emulator

Check your Flutter installation with:

```bash
flutter doctor
```

### Installation

Clone the repository:

```bash
git clone https://github.com/cometkhadija/flower_detection_project.git
```

Navigate to the project directory:

```bash
cd flower_detection_project
```

Install dependencies:

```bash
flutter pub get
```

Run the application:

```bash
flutter run
```

---

## 🤖 Model Deployment

The trained deep learning model is converted into **TensorFlow Lite format** before being integrated into the Flutter application.

The deployed model is stored in:

```text
assets/flower_model_26classes.tflite
```

Flower information is stored locally in:

```text
assets/flower_data_26.json
```

This allows the application to perform flower classification and retrieve associated information locally.

---

## 🔬 Research Contribution

This project goes beyond a conventional flower image classifier by integrating:

1. **Deep learning-based flower recognition**
2. **Mobile-oriented model selection**
3. **TensorFlow Lite deployment**
4. **Offline inference**
5. **Flower knowledge integration**
6. **Medicinal, skincare, and cultivation information**

The research focuses on developing a **complete mobile-based flower recognition and information system**, rather than only evaluating an image classification model.

---

## ⚠️ Limitations

The reported results are based on the prepared dataset and validation setup. Real-world performance may vary depending on factors such as:

* Lighting conditions
* Background complexity
* Image quality
* Camera characteristics
* Flower orientation
* Visual similarity between flower categories

The medicinal and skincare information provided by the application is intended as informational content and should not be considered a substitute for professional medical advice.

---

## 🔮 Future Work

Potential improvements include:

* Expanding the number of flower categories
* Increasing dataset diversity
* Improving performance under natural field conditions
* Further model optimization for low-end mobile devices
* Adding more regional flower species
* Improving multilingual flower information
* Exploring additional lightweight model architectures

---

## 📄 Research

This project is based on the research work:

**“A Study on Flower Identification Using Deep Learning with Integrated Medicinal Properties, Skincare Benefits, and Cultivation Guidance”**

The research investigates a lightweight deep learning approach for mobile-oriented flower identification and integrates the resulting classifier into an offline Android application.

---

## 👩‍💻 Author

**Sayeda Khadija Rahman**

Computer Science & Engineering
Jahangirnagar University, Bangladesh

---

## ⭐ Acknowledgement

This project was developed as an academic/research-oriented project exploring the application of deep learning, computer vision, and mobile AI for accessible flower identification.
