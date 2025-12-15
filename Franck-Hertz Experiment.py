import pandas as pd
import matplotlib.pyplot as plt


filename = "deneme2-16062025.txt"


df = pd.read_csv(
    filename,
    sep="\t",
    skiprows=2,
    names=["U1", "IA"],
    engine="python"
)


df["U1"] = df["U1"].str.replace(",", ".").astype(float)
df["IA"] = df["IA"].str.replace(",", ".").astype(float)


plt.figure()
plt.scatter(df["U1"], df["IA"], s=8)

plt.xlabel("U₁ (V)")
plt.ylabel("Iₐ (nA)")
plt.title("Frank–Hertz Experiment")

plt.grid(True)
plt.show()
