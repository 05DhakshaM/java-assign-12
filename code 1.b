import java.util.Arrays;
import java.util.Scanner;

class GenericArrayOperations<T> {
    private Object[] array;
    private int size;

    public GenericArrayOperations(int initialCapacity) {
        array = new Object[initialCapacity];
        size = 0;
    }

    public void addElementAtEnd(T element) {
        ensureCapacity();
        array[size] = element;
        size++;
    }

    public void deleteElementAt(int position) {
        if (position < 0 || position >= size) {
            throw new IllegalArgumentException("Invalid position");
        }
        System.arraycopy(array, position + 1, array, position, size - position - 1);
        size--;
    }

    private void ensureCapacity() {
        if (size == array.length) {
            array = Arrays.copyOf(array, array.length * 2);
        }
    }

    public void displayArray() {
        System.out.print("Array: ");
        for (int i = 0; i < size; i++) {
            System.out.print(array[i] + " ");
        }
        System.out.println();
    }
}

public class ArrayOperationsExample {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Enter the initial capacity of the array: ");
        int initialCapacity = scanner.nextInt();
        GenericArrayOperations<Integer> arrayOperations = new GenericArrayOperations<>(initialCapacity);

        System.out.print("Enter the number of elements to add: ");
        int numberOfElements = scanner.nextInt();

        for (int i = 0; i < numberOfElements; i++) {
            System.out.print("Enter element " + (i + 1) + ": ");
            int element = scanner.nextInt();
            arrayOperations.addElementAtEnd(element);
        }

        arrayOperations.displayArray();

        System.out.print("Enter the position to delete an element from: ");
        int positionToDelete = scanner.nextInt();

        try {
            arrayOperations.deleteElementAt(positionToDelete);
            System.out.println("Element deleted successfully.");
            arrayOperations.displayArray();
        } catch (IllegalArgumentException e) {
            System.out.println(e.getMessage());
        }

        scanner.close();
    }
}
