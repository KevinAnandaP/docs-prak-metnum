function val = eval_newton(t_in, x_data, b)
    n = length(x_data);
    val = b(1);
    temp_term = 1;

    for i = 2:n
        temp_term = temp_term * (t_in - x_data(i-1));
        val = val + b(i) * temp_term;
    end
end
