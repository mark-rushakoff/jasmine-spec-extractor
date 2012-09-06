/* Just a leading
 * block comment
 */
describe("a spec with a leading block comment", function() {
    it("works", function() {
        expect(1).toBe(1);
    });
    describe("ignore this nested describe", function() {
    });
});
