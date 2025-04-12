import { test } from 'uvu';
import * as assert from 'uvu/assert';
import { calculateNodeOutput } from '../src/core/engine.js';

test('grayscale node output matches expected shape', () => {
  const result = calculateNodeOutput({ type: 'grayscale' });
  assert.ok(result instanceof Uint8ClampedArray);
});

test.run();