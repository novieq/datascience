from sklearn.linear_model import SGDClassifier
X = [[0., 0.], [1., 1.]]
y = [0, 1]
clf = SGDClassifier(loss="hinge", penalty="l2")
clf.fit(X, y)
clf.predict([[2., 2.]])
print clf.coef_

clf = SGDClassifier(loss="log").fit(X, y)
print clf.predict_proba([[1., 1.]])
