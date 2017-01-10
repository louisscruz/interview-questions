import java.lang.Math;

public class LevenshteinDistance {
  public static int calculateDistance(CharSequence left, CharSequence right) {
    int leftLength = left.length();
    int rightLength = right.length();

    if (leftLength == 0) return rightLength;
    if (rightLength == 0) return leftLength;

    int cost = 0;
    if (left.charAt(leftLength - 1) != right.charAt(rightLength - 1)) {
      cost++;
    }

    CharSequence leftSlice = left.subSequence(0, leftLength - 1);
    CharSequence rightSlice = right.subSequence(0, rightLength - 1);

    int leftSub = calculateDistance(leftSlice, right) + 1;
    int rightSub = calculateDistance(left, rightSlice) + 1;
    int bothSub = calculateDistance(leftSlice, rightSlice) + cost;

    int leftRightMin = Math.min(leftSub, rightSub);

    return Math.min(leftRightMin, bothSub);
  }

  public static void main(String[] args) {
    CharSequence left = "kitten";
    CharSequence right = "sitting";

    int answer = LevenshteinDistance.calculateDistance(left, right);

    System.out.println(answer);
    System.out.println(answer == 3);
  }
}
