require 'spec_helper'

# Examples came from http://csrc.nist.gov/groups/ST/toolkit/documents/Examples/ECDSA_Prime.pdf
# Key generation procedures came from http://csrc.nist.gov/publications/fips/fips186-3/fips_186-3.pdf

shared_examples_for 'NIST example' do
  specify 'private key generation with D' do
    point = group.new_point(d)
    expect(point).to eq public_key
  end

  specify 'signature generation' do
    signature = ECDSA.sign(group, d, e, k)
    expect(signature).to eq signature
  end

  specify 'signature verification' do
    result = ECDSA.check_signature!(public_key, e, signature)
    expect(result).to eq true
  end
end

describe 'NIST P-192 examples' do
  let(:group) { ECDSA::Group::Nistp192 }
  let(:d) { 0x78916860_32FD8057_F636B44B_1F47CCE5_64D25099_23A7465B }

  let :public_key do
    group.new_point [
      0xFBA2AAC6_47884B50_4EB8CD5A_0A1287BA_BCC62163_F606A9A2,
      0xDAE6D4CC_05EF4F27_D79EE38B_71C9C8EF_4865D988_50D84AA5,
    ]
  end

  let :signature do
    ECDSA::Signature.new(
      0xF0ECBA72_B88CDE39_9CC5A18E_2A8B7DA5_4D81D04F_B9802821,
      0x1E6D3D4A_E2B1FAB2_BD2040F5_DABF00F8_54FA140B_6D21E8ED,
    )
  end

  let(:k) { 0xD06CB0A0_EF2F708B_0744F08A_A06B6DEE_DEA9C0F8_0A69D847 }
  let(:e) { 0x1B376F0B_735C615C_EEEB31BA_EE654B0A_374825DB }

  it_behaves_like 'NIST example'
end

describe 'NIST P-224 examples' do
  let(:group) { ECDSA::Group::Nistp224 }
  let(:d) { 0x3F0C488E_987C80BE_0FEE521F_8D90BE60_34EC69AE_11CA72AA_777481E8 }

  let(:public_key) do
    group.new_point [
      0xE84FB0B8_E7000CB6_57D7973C_F6B42ED7_8B301674_276DF744_AF130B3E,
      0x4376675C_6FC5612C_21A0FF2D_2A89D298_7DF7A2BC_52183B59_82298555,
    ]
  end

  let :signature do
    ECDSA::Signature.new(
      0xC3A3F5B8_27125320_04C6F6D1_DB672F55_D931C340_9EA1216D_0BE77380,
      0xC5AA1EAE_6095DEA3_4C9BD84D_A3852CCA_41A8BD9D_5548F36D_ABDF6617,
    )
  end

  let(:k) { 0xA548803B_79DF17C4_0CDE3FF0_E36D0251_43BCBBA1_46EC3290_8EB84937 }
  let(:e) { 0x1F1E1CF8_92926CFC_CFC5A28F_EEF3D807_D23F7780_08DBA4B3_5F04B2FD }

  it_behaves_like 'NIST example'
end

describe 'NIST P-256 examples' do
  let(:group) { ECDSA::Group::Nistp256 }

  let(:d) { 0xC477F9F6_5C22CCE2_0657FAA5_B2D1D812_2336F851_A508A1ED_04E479C3_4985BF96 }

  let :public_key do
    group.new_point [
      0xB7E08AFD_FE94BAD3_F1DC8C73_4798BA1C_62B3A0AD_1E9EA2A3_8201CD08_89BC7A19,
      0x3603F747_959DBF7A_4BB226E4_19287290_63ADC7AE_43529E61_B563BBC6_06CC5E09,
    ]
  end

  let :signature  do
    ECDSA::Signature.new(
      0x2B42F576_D07F4165_FF65D1F3_B1500F81_E44C316F_1F0B3EF5_7325B69A_CA46104F,
      0xDC42C212_2D6392CD_3E3A993A_89502A81_98C1886F_E69D262C_4B329BDB_6B63FAF1,
    )
  end

  let(:k) { 0x7A1A7E52_797FC8CA_AA435D2A_4DACE391_58504BF2_04FBE19F_14DBB427_FAEE50AE }
  let(:e) { 0xA41A41A1_2A799548_211C410C_65D8133A_FDE34D28_BDD542E4_B680CF28_99C8A8C4 }

  it_behaves_like 'NIST example'
end

describe 'NIST P-384 examples' do
  let(:group) { ECDSA::Group::Nistp384 }

  let :d do
    0xF92C02ED_629E4B48_C0584B1C_6CE3A3E3_B4FAAE4A_FC6ACB04_55E73DFC_392E6A0A_E393A856_5E6B9714_D1224B57_D83F8A08
  end

  let :public_key do
    group.new_point [
      0x3BF701BC_9E9D36B4_D5F14553_43F09126_F2564390_F2B48736_5071243C_61E6471F_B9D2AB74_657B82F9_086489D9_EF0F5CB5,
      0xD1A358EA_FBF952E6_8D533855_CCBDAA6F_F75B137A_51014431_99325583_552A6295_FFE5382D_00CFCDA3_0344A9B5_B68DB855,
    ]
  end

  let :signature do
    ECDSA::Signature.new(
      0x30EA514F_C0D38D82_08756F06_8113C7CA_DA9F66A3_B40EA3B3_13D040D9_B57DD41A_332795D0_2CC7D507_FCEF9FAF_01A27088,
      0xCC808E50_4BE414F4_6C9027BC_BF78ADF0_67A43922_D6FCAA66_C4476875_FBB7B94E_FD1F7D5D_BE620BFB_821C46D5_49683AD8,
    )
  end

  let :k do
    0x2E44EF1F_8C0BEA83_94E3DDA8_1EC6A784_2A459B53_4701749E_2ED95F05_4F013768_0878E074_9FC43F85_EDCAE06C_C2F43FEF
  end

  let :e do
    0x5AEA187D_1C4F6E1B_35057D20_126D836C_6ADBBC70_49EE0299_C9529F5E_0B3F8B5A_7411149D_6C30D6CB_2B8AF70E_0A781E89
  end

  it_behaves_like 'NIST example'
end

describe 'NIST P-521 examples' do
  let(:group) { ECDSA::Group::Nistp521 }

  let(:d) do
    0x0100_085F47B8_E1B8B11B_7EB33028_C0B2888E_304BFC98_501955B4_5BBA1478_DC184EEE_DF09B86A_5F7C2199_44060727_87205E69_A63709FE_35AA93BA_333514B2_4F961722
  end

  let :public_key  do
    group.new_point [
      0x0098_E91EEF9A_68452822_309C52FA_B453F5F1_17C1DA8E_D796B255_E9AB8F64_10CCA16E_59DF403A_6BDC6CA4_67A37056_B1E54B30_05D8AC03_0DECFEB6_8DF18B17_1885D5C4,
      0x0164_350C321A_ECFC1CCA_1BA4364C_9B156561_50B4B78D_6A48D7D2_8E7F3198_5EF17BE8_554376B7_2900712C_4B83AD66_83272315_26E313F5_F092999A_4632FD50_D946BC2E,
    ]
  end

  let :signature  do
    ECDSA::Signature.new(
      0x0140_C8EDCA57_108CE3F7_E7A240DD_D3AD74D8_1E2DE624_51FC1D55_8FDC7926_9ADACD1C_2526EEEE_F32F8C04_32A9D56E_2B4A8A73_2891C37C_9B96641A_9254CCFE_5DC3E2BA,
      0x00D7_2F15229D_0096376D_A6651D99_85BFD7C0_7F8D4958_3B545DB3_EAB20E0A_2C1E8615_BD9E2984_55BDEB6B_61378E77_AF1C54EE_E2CE37B2_C61F5C9A_8232951C_B988B5B1,
    )
  end

  let :k  do
    0xC91E2349_EF6CA22D_2DE39DD5_1819B6AA_D922D3AE_CDEAB452_BA172F7D_63E370CE_CD70575F_597C09A1_74BA76BE_D05A48E5_62BE0625_336D16B8_703147A6_A231D6BF
  end

  let :e  do
    0x9BF0E1DE_EDA31E00_F925B77F_7CB6B1CE_D7368DE1_DC75BB9F_94582C1C_A709205D_32AF9002_5B02FA13_2FBEBD6C_DDCD9172_C0D66D8E_581767A8_B6F71DE6_0BE1F932
  end

  it_behaves_like 'NIST example'
end
