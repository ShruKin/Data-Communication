## **Definition**
Blocks of data from the source are subjected to a check bit or parity bit generator form, where a parity of: (even)
- 1 is added to the block if it contains odd number of 1’s, and
- 0 is added if it contains even number of 1’s

## **Advantages**
- The advantage is that errors on a noisy line can be caught quickly and only the errant word has to be re-transmitted.
- Using a parity bit incurs a fixed bandwidth penalty, but catches certain errors quickly with little re-transmission cost.

## **Disadvantages**
- Not capable of finding all errors. Only errors which cause an odd number of bits to flip will be detected.
- No way to know which bit is false.
- Not able to correct the data so the data has to be retransmitted.
- On noisy lines, other detection method such as CRC is used to assure that the sent information is received correctly.