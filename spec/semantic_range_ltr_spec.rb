require 'spec_helper'

describe SemanticRange do
  it 'ltr' do
    # [version, range, loose]
    # Version should be less than range
    expect(SemanticRange.ltr('1.2.4', '~1.3.0', false)).to eq(true)
    expect(SemanticRange.ltr('1.2.4', '>=1.3.0', false)).to eq(true)
    expect(SemanticRange.ltr('1.2.1', '~1.2.2', false)).to eq(true)
    expect(SemanticRange.ltr('0.6.1-0', '~0.6.1-1', false)).to eq(true)
    expect(SemanticRange.ltr('0.0.1', '1.0.0 - 2.0.0', false)).to eq(true)
    expect(SemanticRange.ltr('1.0.0-beta.1', '1.0.0-beta.2', false)).to eq(true)
    expect(SemanticRange.ltr('0.0.0', '1.0.0', false)).to eq(true)
    expect(SemanticRange.ltr('1.1.1', '>=2.0.0', false)).to eq(true)
    expect(SemanticRange.ltr('1.2.9', '>=2.0.0', false)).to eq(true)
    expect(SemanticRange.ltr('2.0.0', '>2.0.0', false)).to eq(true)
    expect(SemanticRange.ltr('0.1.5', '0.1.20 || 1.2.4', false)).to eq(true)
    expect(SemanticRange.ltr('1.0.0', '2.x.x', false)).to eq(true)
    expect(SemanticRange.ltr('1.1.0', '1.2.x', false)).to eq(true)
    expect(SemanticRange.ltr('1.0.0', '1.2.x || 2.x', false)).to eq(true)
    expect(SemanticRange.ltr('1.0.1', '2.*.*', false)).to eq(true)
    expect(SemanticRange.ltr('1.1.3', '1.2.*', false)).to eq(true)
    expect(SemanticRange.ltr('1.1.9999', '1.2.* || 2.*', false)).to eq(true)
    expect(SemanticRange.ltr('1.0.0', '2', false)).to eq(true)
    expect(SemanticRange.ltr('2.2.2', '2.3', false)).to eq(true)
    expect(SemanticRange.ltr('2.3.0', '~2.4', false)).to eq(true) # >=2.4.0 <2.5.0
    expect(SemanticRange.ltr('2.3.5', '~2.4', false)).to eq(true)
    expect(SemanticRange.ltr('3.2.0', '~>3.2.1', false)).to eq(true) # >=3.2.1 <3.3.0
    expect(SemanticRange.ltr('0.2.3', '~1', false)).to eq(true) # >=1.0.0 <2.0.0
    expect(SemanticRange.ltr('0.2.4', '~>1', false)).to eq(true)
    expect(SemanticRange.ltr('0.2.3', '~> 1', false)).to eq(true)
    expect(SemanticRange.ltr('0.1.2', '~1.0', false)).to eq(true) # >=1.0.0 <1.1.0
    expect(SemanticRange.ltr('0.1.0', '~ 1.0', false)).to eq(true)
    expect(SemanticRange.ltr('1.2.0', '>1.2', false)).to eq(true)
    expect(SemanticRange.ltr('1.2.1', '> 1.2', false)).to eq(true)
    expect(SemanticRange.ltr('0.0.0beta', '1', true)).to eq(true)
    expect(SemanticRange.ltr('0.5.4-alpha', '~v0.5.4-pre', false)).to eq(true)
    expect(SemanticRange.ltr('0.5.4-alpha', '~v0.5.4-pre', false)).to eq(true)
    expect(SemanticRange.ltr('0.6.0', '=0.7.x', false)).to eq(true)
    expect(SemanticRange.ltr('0.6.0-asdf', '=0.7.x', false)).to eq(true)
    expect(SemanticRange.ltr('0.6.0', '>=0.7.x', false)).to eq(true)
    expect(SemanticRange.ltr('1.2.1', '~1.2.2', false)).to eq(true)
    expect(SemanticRange.ltr('0.2.3', '1.0.0 - 2.0.0', false)).to eq(true)
    expect(SemanticRange.ltr('0.0.1', '1.0.0', false)).to eq(true)
    expect(SemanticRange.ltr('1.0.0', '>=2.0.0', false)).to eq(true)
    expect(SemanticRange.ltr('1.9999.9999', '>=2.0.0', false)).to eq(true)
    expect(SemanticRange.ltr('1.2.9', '>=2.0.0', false)).to eq(true)
    expect(SemanticRange.ltr('2.0.0', '>2.0.0', false)).to eq(true)
    expect(SemanticRange.ltr('1.2.9', '>2.0.0', false)).to eq(true)
    expect(SemanticRange.ltr('1.1.3', '2.x.x', false)).to eq(true)
    expect(SemanticRange.ltr('1.1.3', '1.2.x', false)).to eq(true)
    expect(SemanticRange.ltr('1.1.3', '1.2.x || 2.x', false)).to eq(true)
    expect(SemanticRange.ltr('1.1.3', '2.*.*', false)).to eq(true)
    expect(SemanticRange.ltr('1.1.3', '1.2.*', false)).to eq(true)
    expect(SemanticRange.ltr('1.1.3', '1.2.* || 2.*', false)).to eq(true)
    expect(SemanticRange.ltr('1.9999.9999', '2', false)).to eq(true)
    expect(SemanticRange.ltr('2.2.1', '2.3', false)).to eq(true)
    expect(SemanticRange.ltr('2.3.0', '~2.4', false)).to eq(true) # >=2.4.0 <2.5.0
    expect(SemanticRange.ltr('2.3.2', '~>3.2.1', false)).to eq(true) # >=3.2.1 <3.3.0
    expect(SemanticRange.ltr('0.2.3', '~1', false)).to eq(true) # >=1.0.0 <2.0.0
    expect(SemanticRange.ltr('0.2.3', '~>1', false)).to eq(true)
    expect(SemanticRange.ltr('0.0.0', '~1.0', false)).to eq(true) # >=1.0.0 <1.1.0
    expect(SemanticRange.ltr('1.0.0', '>1', false)).to eq(true)
    expect(SemanticRange.ltr('1.0.0beta', '2', true)).to eq(true)
    expect(SemanticRange.ltr('1.0.0beta', '>1', true)).to eq(true)
    expect(SemanticRange.ltr('1.0.0beta', '> 1', true)).to eq(true)
    expect(SemanticRange.ltr('0.6.2', '=0.7.x', false)).to eq(true)
    expect(SemanticRange.ltr('0.7.0-asdf', '=0.7.x', false)).to eq(true)
    expect(SemanticRange.ltr('1.0.0-0', '^1', false)).to eq(true)
    expect(SemanticRange.ltr('0.7.0-asdf', '>=0.7.x', false)).to eq(true)
    expect(SemanticRange.ltr('1.0.0beta', '1', true)).to eq(true)
    expect(SemanticRange.ltr('0.6.2', '>=0.7.x', false)).to eq(true)
    expect(SemanticRange.ltr('1.3.0-alpha', '>1.2.3', false)).to eq(true)
  end

  it 'negative ltr' do
    # [version, range, loose]
    # Version should NOT be less than range
    expect(SemanticRange.ltr('1.2.4', '1.2.4', false)).to eq(false)
    expect(SemanticRange.ltr('1.1.0', '~ 1.0', false)).to eq(false)
    expect(SemanticRange.ltr('0.6.1-1', '~0.6.1-1', false)).to eq(false)
    expect(SemanticRange.ltr('1.2.3', '1.0.0 - 2.0.0', false)).to eq(false)
    expect(SemanticRange.ltr('2.9.9', '1.0.0 - 2.0.0', false)).to eq(false)
    expect(SemanticRange.ltr('1.0.0', '1.0.0', false)).to eq(false)
    expect(SemanticRange.ltr('0.2.4', '>=*', false)).to eq(false)
    expect(SemanticRange.ltr('1.0.0', '', true)).to eq(false)
    expect(SemanticRange.ltr('1.2.3', '*', false)).to eq(false)
    expect(SemanticRange.ltr('1.0.0', '>=1.0.0', false)).to eq(false)
    expect(SemanticRange.ltr('1.0.1', '>=1.0.0', false)).to eq(false)
    expect(SemanticRange.ltr('1.1.0', '>=1.0.0', false)).to eq(false)
    expect(SemanticRange.ltr('1.0.1', '>1.0.0', false)).to eq(false)
    expect(SemanticRange.ltr('1.1.0', '>1.0.0', false)).to eq(false)
    expect(SemanticRange.ltr('2.0.0', '<=2.0.0', false)).to eq(false)
    expect(SemanticRange.ltr('1.9999.9999', '<=2.0.0', false)).to eq(false)
    expect(SemanticRange.ltr('0.2.9', '<=2.0.0', false)).to eq(false)
    expect(SemanticRange.ltr('1.9999.9999', '<2.0.0', false)).to eq(false)
    expect(SemanticRange.ltr('0.2.9', '<2.0.0', false)).to eq(false)
    expect(SemanticRange.ltr('1.0.0', '>= 1.0.0', false)).to eq(false)
    expect(SemanticRange.ltr('1.0.1', '>=  1.0.0', false)).to eq(false)
    expect(SemanticRange.ltr('1.1.0', '>=   1.0.0', false)).to eq(false)
    expect(SemanticRange.ltr('1.0.1', '> 1.0.0', false)).to eq(false)
    expect(SemanticRange.ltr('1.1.0', '>  1.0.0', false)).to eq(false)
    expect(SemanticRange.ltr('2.0.0', '<=   2.0.0', false)).to eq(false)
    expect(SemanticRange.ltr('1.9999.9999', '<= 2.0.0', false)).to eq(false)
    expect(SemanticRange.ltr('0.2.9', '<=  2.0.0', false)).to eq(false)
    expect(SemanticRange.ltr('1.9999.9999', '<    2.0.0', false)).to eq(false)
    expect(SemanticRange.ltr('0.2.9', "<\t2.0.0", false)).to eq(false)
    expect(SemanticRange.ltr('v0.1.97', '>=0.1.97', false)).to eq(false)
    expect(SemanticRange.ltr('0.1.97', '>=0.1.97', false)).to eq(false)
    expect(SemanticRange.ltr('1.2.4', '0.1.20 || 1.2.4', false)).to eq(false)
    #expect(SemanticRange.ltr('1.2.4', '0.1.20 || >1.2.4', false)).to eq(false)
    #expect(SemanticRange.ltr('1.2.3', '0.1.20 || 1.2.4', false)).to eq(false)
    expect(SemanticRange.ltr('0.1.20', '0.1.20 || 1.2.4', false)).to eq(false)
    expect(SemanticRange.ltr('0.0.0', '>=0.2.3 || <0.0.1', false)).to eq(false)
    expect(SemanticRange.ltr('0.2.3', '>=0.2.3 || <0.0.1', false)).to eq(false)
    expect(SemanticRange.ltr('0.2.4', '>=0.2.3 || <0.0.1', false)).to eq(false)
    expect(SemanticRange.ltr('1.3.4', '||', false)).to eq(false)
    expect(SemanticRange.ltr('2.1.3', '2.x.x', false)).to eq(false)
    expect(SemanticRange.ltr('1.2.3', '1.2.x', false)).to eq(false)
    expect(SemanticRange.ltr('2.1.3', '1.2.x || 2.x', false)).to eq(false)
    expect(SemanticRange.ltr('1.2.3', '1.2.x || 2.x', false)).to eq(false)
    expect(SemanticRange.ltr('1.2.3', 'x', false)).to eq(false)
    expect(SemanticRange.ltr('2.1.3', '2.*.*', false)).to eq(false)
    expect(SemanticRange.ltr('1.2.3', '1.2.*', false)).to eq(false)
    expect(SemanticRange.ltr('2.1.3', '1.2.* || 2.*', false)).to eq(false)
    expect(SemanticRange.ltr('1.2.3', '1.2.* || 2.*', false)).to eq(false)
    expect(SemanticRange.ltr('1.2.3', '1.2.* || 2.*', false)).to eq(false)
    expect(SemanticRange.ltr('1.2.3', '*', false)).to eq(false)
    expect(SemanticRange.ltr('2.1.2', '2', false)).to eq(false)
    expect(SemanticRange.ltr('2.3.1', '2.3', false)).to eq(false)
    expect(SemanticRange.ltr('2.4.0', '~2.4', false)).to eq(false) # >=2.4.0 <2.5.))
    expect(SemanticRange.ltr('2.4.5', '~2.4', false)).to eq(false)
    expect(SemanticRange.ltr('3.2.2', '~>3.2.1', false)).to eq(false) # >=3.2.1 <3.3.))
    expect(SemanticRange.ltr('1.2.3', '~1', false)).to eq(false) # >=1.0.0 <2.0.))
    expect(SemanticRange.ltr('1.2.3', '~>1', false)).to eq(false)
    expect(SemanticRange.ltr('1.2.3', '~> 1', false)).to eq(false)
    expect(SemanticRange.ltr('1.0.2', '~1.0', false)).to eq(false) # >=1.0.0 <1.1.))
    expect(SemanticRange.ltr('1.0.2', '~ 1.0', false)).to eq(false)
    expect(SemanticRange.ltr('1.0.0', '>=1', false)).to eq(false)
    expect(SemanticRange.ltr('1.0.0', '>= 1', false)).to eq(false)
    expect(SemanticRange.ltr('1.1.1', '<1.2', false)).to eq(false)
    expect(SemanticRange.ltr('1.1.1', '< 1.2', false)).to eq(false)
    expect(SemanticRange.ltr('0.5.5', '~v0.5.4-pre', false)).to eq(false)
    expect(SemanticRange.ltr('0.5.4', '~v0.5.4-pre', false)).to eq(false)
    expect(SemanticRange.ltr('0.7.2', '=0.7.x', false)).to eq(false)
    expect(SemanticRange.ltr('0.7.2', '>=0.7.x', false)).to eq(false)
    expect(SemanticRange.ltr('0.6.2', '<=0.7.x', false)).to eq(false)
    expect(SemanticRange.ltr('0.2.5', '>0.2.3 >0.2.4 <=0.2.5', false)).to eq(false)
    expect(SemanticRange.ltr('0.2.4', '>=0.2.3 <=0.2.4', false)).to eq(false)
    expect(SemanticRange.ltr('2.0.0', '1.0.0 - 2.0.0', false)).to eq(false)
    expect(SemanticRange.ltr('4.0.0', '^3.0.0', false)).to eq(false)
    expect(SemanticRange.ltr('2.0.0', '^1.0.0 || ~2.0.1', false)).to eq(false)
    expect(SemanticRange.ltr('3.2.0', '^0.1.0 || ~3.0.1 || 5.0.0', false)).to eq(false)
    expect(SemanticRange.ltr('1.0.0beta', '^0.1.0 || ~3.0.1 || 5.0.0', true)).to eq(false)
    expect(SemanticRange.ltr('5.0.0-0', '^0.1.0 || ~3.0.1 || 5.0.0', true)).to eq(false)
    expect(SemanticRange.ltr('3.5.0', '^0.1.0 || ~3.0.1 || >4 <=5.0.0', false)).to eq(false)
    expect(SemanticRange.ltr('1.0.0beta', '^1.0.0alpha', true)).to eq(false)
    expect(SemanticRange.ltr('1.0.0beta', '~1.0.0alpha', true)).to eq(false)
    expect(SemanticRange.ltr('1.0.0beta', '^1.0.0-alpha', true)).to eq(false)
    expect(SemanticRange.ltr('1.0.0beta', '~1.0.0-alpha', true)).to eq(false)
    expect(SemanticRange.ltr('1.0.0-beta', '^1.0.0-alpha', false)).to eq(false)
    expect(SemanticRange.ltr('1.0.0-beta', '~1.0.0-alpha', false)).to eq(false)
    #expect(SemanticRange.ltr('1.0.0', '=0.1.0', false)).to eq(false)
  end
end
