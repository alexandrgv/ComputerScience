// java
// Интерпретатор для простых арифметических выражений
// Грамматика: выражение ::= число | выражение '+' выражение | выражение '-' выражение

// Клиент: строит синтаксическое дерево и интерпретирует
public class code {
    public static void main(String[] args) throws Exception {
        // Выражение: 5 + (10 - 3)
        // Числа 5, 10, 3 - терминальные узлы
        // Сложение и вычитание - нетерминальные узлы
        Expression expression = new AddExpr(
            new NumberExpr(5),
            new SubtractExpr(new NumberExpr(10), new NumberExpr(3))
        );
        // Вычисляем результат, обходя дерево в глубину
        int result = expression.interpret();
        System.out.println("Результат: " + result); // 12
        System.in.read(); // Пауза
    }
}

// AbstractExpression - общий интерфейс для всех узлов дерева разбора
interface Expression {
    int interpret(); // метод интерпретации (вычисления)
}

// TerminalExpression - число (лист дерева)
class NumberExpr implements Expression {
    private int number;
    public NumberExpr(int number) { this.number = number; }
    public int interpret() { return number; } // возвращает своё числовое значение
}

// NonterminalExpression для сложения
class AddExpr implements Expression {
    private Expression left, right;
    public AddExpr(Expression left, Expression right) {
        this.left = left; this.right = right;
    }
    // рекурсивно вычисляем левое и правое подвыражения, затем складываем
    public int interpret() {
        return left.interpret() + right.interpret();
    }
}

// NonterminalExpression для вычитания
class SubtractExpr implements Expression {
    private Expression left, right;
    public SubtractExpr(Expression left, Expression right) {
        this.left = left; this.right = right;
    }
    public int interpret() {
        return left.interpret() - right.interpret();
    }
}

// Результат: 12
