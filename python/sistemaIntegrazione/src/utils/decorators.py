"""Module containing decorators for logging and debugging functions."""
import functools
import time
import traceback
from typing import Callable


def debug_log(func: Callable):
    """
    Decoratore che aggiunge logging di debug a una funzione.
    
    Args:
        func: La funzione da decorare
        
    Returns:
        wrapper: La funzione decorata con logging
    """
    @functools.wraps(func)
    def wrapper(*args, **kwargs):
        print(f"\nEntrando in {func.__name__}")
        start_time = time.time()
        try:
            result = func(*args, **kwargs)
            end_time = time.time()
            print(
                f"Uscendo da {func.__name__}. Tempo di esecuzione: {end_time - start_time:.2f}s"
            )
            return result
        except Exception as e:
            print(f"Errore in {func.__name__}:")
            print(f"Tipo errore: {type(e).__name__}")
            print(f"Messaggio: {str(e)}")
            print("Traceback:")
            print(traceback.format_exc())
            raise

    return wrapper
