Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7553C433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 20:22:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1660.1646943776990168794
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 10 Mar 2022 12:22:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=IiowQoUM;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=0068e34002=joe.slater@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22ADPruJ014929;
	Thu, 10 Mar 2022 12:22:54 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=CQtFbvV/UJxi+WSNTPLzF5IRX06d8VyiMtQVSOV+tUk=;
 b=IiowQoUM9hoE2662rW58R9ZdlkJ5a+LFp/Yf8Pr/DW8tj5uFH3ppDYfr4AWTZ4aqt0SN
 IUO0S4L++c2b1E8Ufqp/+IX+4xNoQGuiqY6xVgL2YPuCC83QTSiLuT3vsAp2Bn3qEV9F
 iQi1DOOwkXW+LfFx1bgsKv8+mKhrjNeZbNALKU2LXmBPgMt+nC6B7pfcPGaxGHNazKz5
 yqtEFif5arNEBfpiMSQ7QpN2A9S8QZ/kX3/wUQ5MnV9qlb79ilYxjy2g8ntuniQk6j3p
 xcJgtSpx3VA5OphTiOBgpidztcN/CpVSY7tdA05PLyMDyuPJtKkzCA8WgMCiA9jHkRCy Eg==
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2102.outbound.protection.outlook.com [104.47.70.102])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3enew6uckm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Mar 2022 12:22:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IuhtpyZ9VGbq4NKZyRFaphX48ZtyHumVkLQCiqwHabM+jOLRESt9BDMaWqNQa8UdWHGVThWaY8yx8dk/qmjjZHY0eqUawEo+GLAG7ptmwce5Hq0bi2Wc+dOGyZWnNlutGO+M1879vaVaZq054P1KzyB+w2m3tEe3t1F4X8hrY40xZqXnpx9k+C5L4FF7D8DpSXs1qc5r58du2UbyTp/cA+wo0NdBlC1/wXeHZzAhM7QO/OL26+xkJRc5XcNix1xfZElWrZbVdxDamqufSgfJLwqYFDZTpAhIEe18WNO+QQt3cqRTt0kZxYJXtIdDVQpNbzTgQU0NKpn7Dhhnm7oLPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQtFbvV/UJxi+WSNTPLzF5IRX06d8VyiMtQVSOV+tUk=;
 b=kizAA10iiAvLjBdBh2SRpncqi9YTRsHOiAcoZs+oy3sTBJNBwh/3pR1Z88B0ecPnyNZ3LblJWzbsVEyf2cZGi6pw682cHJajZ7b9GiIuNCXaSoVUnGT0Pp43HPdt8ZU0b8obwpL1CLhs9CHk2m62qxayVKiI/968Ew8NzILbt5kw8kShzMF+fCDX+UYKWDPCVlUhQnYGUxS26aqWOjqUagZLSxhDTg1Iy58Q2e64hlChh01hZytvyQkKL3JjUEv0RGmHkUn3xLu0vQPmQ/Tnr+gCMxmjSwCcvcbPvDFrFOYyJO1bGiQxlbO+6RTcrjdTaBoSbDJUcUWPv3mcwcNz9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by MN2PR11MB3726.namprd11.prod.outlook.com (2603:10b6:208:ef::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Thu, 10 Mar
 2022 20:22:50 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::389d:5330:bc19:13c4]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::389d:5330:bc19:13c4%7]) with mapi id 15.20.5061.022; Thu, 10 Mar 2022
 20:22:50 +0000
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>,
        "MacLeod, Randy"
	<Randy.MacLeod@windriver.com>
Subject: RE: [meta-virtualization] [meta-virt][PATCH 1/1] libvert: modify
 dependencies on lxc_protocol.h
Thread-Topic: [meta-virtualization] [meta-virt][PATCH 1/1] libvert: modify
 dependencies on lxc_protocol.h
Thread-Index: AQHYNKC+ZeFbr5V3UE+FKE3tSyaeKKy5BIgAgAAIlBA=
Date: Thu, 10 Mar 2022 20:22:50 +0000
Message-ID: 
 <BY5PR11MB39924E4F0789ED4A8D60E760880B9@BY5PR11MB3992.namprd11.prod.outlook.com>
References: <20220310170304.4783-1-joe.slater@windriver.com>
 <20220310194152.GA37392@gmail.com>
In-Reply-To: <20220310194152.GA37392@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 038d62ab-c619-4930-6240-08da02d3bfc3
x-ms-traffictypediagnostic: MN2PR11MB3726:EE_
x-microsoft-antispam-prvs: 
 <MN2PR11MB37269C552260E58E37A354A2880B9@MN2PR11MB3726.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 aVlVLksDXlxJ40GcQvPadlqRYS7473bYUZhhuMg/uLq3J+3EfRQPJH5AJ6LAjwCBd+dGjGrFUH1xvKjqt1ES/Wd9YaEmf/cH7L4WijTU9hjJ5HvweTCBxtO6h8O9uqc/INofQqgXru/CEbYZJpRpl8SkZNnq5andM01Tf+5psBsWu9XIXJd4tvPbtNEU86ydBIp1TZqHhVwhvZ0CWyyZmuvptT5/gp/YDS1gSc8F/OBBtaHLUNKOfoFirqT9WZwPMBu3/9lPPegOLRE+l5i25iS5rE3DQzfPxNK8qPul3iR7EMRN3qvFt9GEwyN5gh8KiqkzP8d1uKZZ27xL2NWjs1xXjlEAXpH7dvE24jnz4zf1fqRxk7C1+PeOADMpGbn+JrLW9MNgY9QLbzkfuYvT2zLTyg59iRcmrr27aLHt8MAGvKysQVc2imojC8CiWvnqPG3PNwvrf/fNFvBNw1IG9PGYhtrFfS6/v4aa6ZYrnbiKC2n4jNqVNAiOqbveoTz1pQBzZc9UGw+0maz2H/SfAvWVc8vF0j+xY73sJMehldyNPoQyPIkTloWp4c22rtoc2qn8Lv6q26Hkrqwphi+flrgUlqgL3sjAIzRet0i+Fq2K2WZ8G4twxevXUpRSd9mTM/rCETo7kT2NVB8XFZhvahp9b20ya3acJjieNtx5If3Aizj6ocmhxbRTIolnJpLCXNrmh8+wr3qn/DjWzYgw32dSZeoNJgj86NRlLRew1lNxUjzlH+3W1YRXnOdrf6r1Hhoya6rrRBjbXH0p6Tv5fcnsFHwJIa9hhvmmst0Qtn2T+7E7aaR3JcjRMYTv5BcJW9zYudkDPwFlz1BHg63PISWewd3V4IzdVPMUxhSIxdA=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(8936002)(9686003)(52536014)(7696005)(55016003)(316002)(6506007)(2906002)(53546011)(83380400001)(508600001)(966005)(66946007)(66556008)(76116006)(64756008)(66446008)(66476007)(38070700005)(33656002)(8676002)(4326008)(30864003)(54906003)(6916009)(71200400001)(122000001)(38100700002)(107886003)(5660300002)(186003)(26005)(21314003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?K2kXe3PdBOQVS/g1u9iFFgaX7alfdjtk0FpIYFr3INUTLkay8+ULzK3Zvcdx?=
 =?us-ascii?Q?UjK5qS7Sb01R/GcjXa8EIPKHgK/HuGBYyJe6va7B5GAS/UFuYKg1+sBNzXzu?=
 =?us-ascii?Q?qHabkTNAIx5fxOND7uSSXBA/A/5IrhbHFTK9j89nvTcPN3ELSq1HGOIPczq/?=
 =?us-ascii?Q?zrs6lKykoDCSdDCjKPzfByI1JQLzr35P4oWzhB4RZHSWfBiZjz2UsIxAPIpJ?=
 =?us-ascii?Q?9rRFGDI1mENF3+TGrx7j1CCCJNczMuPB4rqKr7SjuWkrgZTnKRoWHGnc5yh/?=
 =?us-ascii?Q?qgG+oI0HCjUGeewB8MQZsYqegD0NwS3MLAIyKKU9BUq4TMuOZoDhjrzbGQiz?=
 =?us-ascii?Q?bnPMUZ5H+HcW8Bnao7MSUXg0VhzQ8e7jIjxsvx4sxjZCxGZR2Y5LrYm9i/er?=
 =?us-ascii?Q?JMs8u/AVyZUsL+mjeINYiIpIuuYDp95kk7DIuU9YX6zTVwVaEzqKJGArIABB?=
 =?us-ascii?Q?93r6pqkPa4rLKyXZXlufx1IPkoIBOhF8jewwwrX6XLEgCys7rP+M/zwPxA4o?=
 =?us-ascii?Q?JaO8lERxntUXjBanjsD1CLUj2AP4BV6Wkbx0k2GzHal8yihMPDwkk/8RjpiI?=
 =?us-ascii?Q?Pbge/mSypA1XBfPa9f+KZImie5NMq1V6wn0fCgVlY6vdvo/5bNUZQORVil4I?=
 =?us-ascii?Q?Ux1KIJ57aAEuMMWZNKLl/MNhlhrNuKAG+P199MRV3k8u3cUVYS0XpNw29A5Q?=
 =?us-ascii?Q?HccOUqAx+AXtIqTISGlYJxvfisG/sokAKQQStIzgLQvSsErtSCikzxB5EwmH?=
 =?us-ascii?Q?yCj9vzcC2AQa0dJ0Afiz4lj/DZ/6GJee6LbjosI8SWwD+YySKUEJ7XP/V0zE?=
 =?us-ascii?Q?ruxKq20xeJh1bWbiW3F1+hMkEFQbTxa9W6cOO8mlWNnXgADeCQWnVas0MXPk?=
 =?us-ascii?Q?MfKAvNz/ss69yyVviKE66uhn2oUohR0SiarTcky0V6K9EoZ/BHWgVRGNpUEr?=
 =?us-ascii?Q?O8yJhK1DEodHKkooPyEoBGj/ff/Lf1Vd4Yk1Ysx2dcqPAIibXtRfPFor90As?=
 =?us-ascii?Q?y+rozc2xCf9TjE/9MF+IIEYSP0hZIuxxoZZq8gQKcgkNkrEFzdd9VVShJKZa?=
 =?us-ascii?Q?BeTvfZZ7DTfBk+Xnc85ZOrSw5LxIke3MBBCOYq8BUOaQhgSQV82SQwwj5zE6?=
 =?us-ascii?Q?KLyLHOGRwJOLEAKQi1YqsLfvIyugf6ADjedZkRy0XP5dRnfVRuRJ+ZPafg1h?=
 =?us-ascii?Q?ZsJbiPHvNJzJnrZ82u10ZzlYE8Buri7cY65iii2JFaQ85n8FGIl8rGPledMW?=
 =?us-ascii?Q?ekUY+k0WOiCVMCsTz8ABGmcHcPce4f8fy7EEQtS+OCQ2bgBzgTK/VMv5DOQp?=
 =?us-ascii?Q?50x4wzPiof0/vuoVIShGbJnMrN5qOBwtdcbRuOzdkPc76aBcwvQV/MYMyFT7?=
 =?us-ascii?Q?3356d5NmsuoGREug5JHbS+laKiTetQm6eo3XD9splJezISLB2SzC3Ki+awGL?=
 =?us-ascii?Q?CwVplif5dijwydVSuMfdmj23P0c5J/es?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 038d62ab-c619-4930-6240-08da02d3bfc3
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2022 20:22:50.3860
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 OYiBXgA/u8jFgHvQOTmMu+MVsMsLxmHFa29edwRiO/KuhAtRSKRUNbwG0X30QsyqWTFbMAeZChuK0/XtLBThoy9HGRrDXtviIe+G75WTOKg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3726
X-Proofpoint-ORIG-GUID: m0ohM0TPPodFrEHR-duV2isNLinLSHk1
X-Proofpoint-GUID: m0ohM0TPPodFrEHR-duV2isNLinLSHk1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-10_09,2022-03-09_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 clxscore=1011 spamscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203100103
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 10 Mar 2022 20:22:57 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7088

I have never seen the failure.  This is from a build that did see it.

NOTE: recipe qemu-6.2.0-r0: task do_package_qa: Succeeded
NOTE: recipe libvirt-7.2.0-r0: task do_configure: Succeeded
NOTE: Running task 7977 of 8013 (/buildarea1/master-wr/build/Benchmark/cust=
omized_systemd/220308-063739/lxbuilds/builder_platform_up/intel-x86-64-pree=
mpt-rt-ovp-kvm/wrlinux/layers/meta-virtualization/recipes-extended/libvirt/=
libvirt_7.2.0.bb:do_compile)
NOTE: recipe libvirt-7.2.0-r0: task do_compile: Started
ERROR: libvirt-7.2.0-r0 do_compile: ExecutionError('/buildarea1/master-wr/b=
uild/Benchmark/customized_systemd/220308-063739/lxbuilds/builder_platform_u=
p/intel-x86-64-preempt-rt-ovp-kvm/wrlinux/build/tmp-glibc/work/corei7-64-wr=
s-linux/libvirt/7.2.0-r0/temp/run.do_compile.3629283', 1, None, None)
Transferring /buildarea1/master-wr/build/Benchmark/customized_systemd/22030=
8-063739/lxbuilds/builder_platform_up/intel-x86-64-preempt-rt-ovp-kvm/wrlin=
ux/build/tmp-glibc/work/corei7-64-wrs-linux/libvirt/7.2.0-r0/temp/log.do_co=
mpile.3629283 to /buildarea1/master-wr/log/Benchmark/intel-x86-64/customize=
d_systemd/builder_preempt-rt_ovp-kvm_OE_systemd/220308-063739/boottime/inte=
l-x86-64_platform/builder.None.preemptrt.true.ovpkvm.lpgbuildcdcWASSP_LINUX=
_MASTER_WRtestcaseswrlinuxutilsfrags/errorlogs
ERROR: Logfile of failure stored in: /buildarea1/master-wr/build/Benchmark/=
customized_systemd/220308-063739/lxbuilds/builder_platform_up/intel-x86-64-=
preempt-rt-ovp-kvm/wrlinux/build/tmp-glibc/work/corei7-64-wrs-linux/libvirt=
/7.2.0-r0/temp/log.do_compile.3629283
Log data follows:
| DEBUG: Executing shell function do_compile
| [1/1274] Generating src/esx/virtesxgensources with a custom command
| [2/1274] Generating src/rpc/virkeepaliveprotocol.h with a custom command
| [3/1274] Generating src/rpc/virkeepaliveprotocol.c with a custom command
...
Wold-style-definition -Wopenmp-simd -Woverflow -Woverride-init -Wpacked-bit=
field-compat -Wpacked-not-aligned -Wparentheses -Wpointer-arith -Wpointer-c=
ompare -Wpointer-sign -Wpointer-to-int-cast -Wpragmas -Wpsabi -Wrestrict -W=
return-local-addr -Wreturn-type -Wscalar-storage-order -Wsequence-point -Ws=
hadow -Wshift-count-negative -Wshift-count-overflow -Wshift-negative-value =
-Wsizeof-array-argument -Wsizeof-pointer-div -Wsizeof-pointer-memaccess -Ws=
trict-aliasing -Wstrict-prototypes -Wstringop-truncation -Wsuggest-attribut=
e=3Dcold -Wsuggest-attribute=3Dconst -Wsuggest-attribute=3Dformat -Wsuggest=
-attribute=3Dnoreturn -Wsuggest-attribute=3Dpure -Wsuggest-final-methods -W=
suggest-final-types -Wswitch -Wswitch-bool -Wswitch-unreachable -Wsync-nand=
 -Wtautological-compare -Wtrampolines -Wtrigraphs -Wtype-limits -Wuninitial=
ized -Wunknown-pragmas -Wunused -Wunused-but-set-parameter -Wunused-but-set=
-variable -Wunused-function -Wunused-label -Wunused-local-typedefs -Wunused=
-parameter -Wunused-result -Wunused-value -Wunused-variable -Wvarargs -Wvar=
iadic-macros -Wvector-operation-performance -Wvla -Wvolatile-register-var -=
Wwrite-strings -Walloc-size-larger-than=3D9223372036854775807 -Warray-bound=
s=3D2 -Wattribute-alias=3D2 -Wformat-overflow=3D2 -Wformat-truncation=3D2 -=
Wimplicit-fallthrough=3D5 -Wnormalized=3Dnfc -Wshift-overflow=3D2 -Wstringo=
p-overflow=3D2 -Wunused-const-variable=3D2 -Wno-sign-compare -Wno-cast-func=
tion-type -Wjump-misses-init -Wswitch-enum -Wno-format-nonliteral -Wno-form=
at-truncation -Wframe-larger-than=3D4096 -fexceptions -fasynchronous-unwind=
-tables -fipa-pure-const -Wno-suggest-attribute=3Dpure -Wno-suggest-attribu=
te=3Dconst -fstack-protector-strong -Wdouble-promotion -O2 -pipe -g -felimi=
nate-unused-debug-types -fmacro-prefix-map=3D/buildarea1/master-wr/build/Be=
nchmark/customized_systemd/220308-063739/lxbuilds/builder_platform_up/intel=
-x86-64-preempt-rt-ovp-kvm/wrlinux/build/tmp-glibc/work/corei7-64-wrs-linux=
/libvirt/7.2.0-r0=3D/usr/src/debug/libvirt/7.2.0-r0 -fdebug-prefix-map=3D/b=
uildarea1/master-wr/build/Benchmark/customized_systemd/220308-063739/lxbuil=
ds/builder_platform_up/intel-x86-64-preempt-rt-ovp-kvm/wrlinux/build/tmp-gl=
ibc/work/corei7-64-wrs-linux/libvirt/7.2.0-r0=3D/usr/src/debug/libvirt/7.2.=
0-r0 -fdebug-prefix-map=3D/buildarea1/master-wr/build/Benchmark/customized_=
systemd/220308-063739/lxbuilds/builder_platform_up/intel-x86-64-preempt-rt-=
ovp-kvm/wrlinux/build/tmp-glibc/work/corei7-64-wrs-linux/libvirt/7.2.0-r0/r=
ecipe-sysroot=3D -fdebug-prefix-map=3D/buildarea1/master-wr/build/Benchmark=
/customized_systemd/220308-063739/lxbuilds/builder_platform_up/intel-x86-64=
-preempt-rt-ovp-kvm/wrlinux/build/tmp-glibc/work/corei7-64-wrs-linux/libvir=
t/7.2.0-r0/recipe-sysroot-native=3D -fPIE -pthread -DIN_LIBVIRT '-Dabs_top_=
builddir=3D"/buildarea1/master-wr/build/Benchmark/customized_systemd/220308=
-063739/lxbuilds/builder_platform_up/intel-x86-64-preempt-rt-ovp-kvm/wrlinu=
x/build/tmp-glibc/work/corei7-64-wrs-linux/libvirt/7.2.0-r0/build"' '-Dabs_=
top_srcdir=3D"/buildarea1/master-wr/build/Benchmark/customized_systemd/2203=
08-063739/lxbuilds/builder_platform_up/intel-x86-64-preempt-rt-ovp-kvm/wrli=
nux/build/tmp-glibc/work/corei7-64-wrs-linux/libvirt/7.2.0-r0/libvirt-7.2.0=
"' '-DDAEMON_NAME=3D"virtstoraged"' '-DMODULE_NAME=3D"storage"' -MD -MQ src=
/virtstoraged.p/remote_remote_daemon.c.o -MF src/virtstoraged.p/remote_remo=
te_daemon.c.o.d -o src/virtstoraged.p/remote_remote_daemon.c.o -c ../libvir=
t-7.2.0/src/remote/remote_daemon.c
| In file included from ../libvirt-7.2.0/src/remote/remote_daemon.c:39:
| ../libvirt-7.2.0/src/remote/remote_daemon.h:29:10: fatal error: lxc_proto=
col.h: No such file or directory
|    29 | #include "lxc_protocol.h"
|       |          ^~~~~~~~~~~~~~~~
| compilation terminated.
| [293/1274] Compiling C object src/admin/libvirt_admin_driver.a.p/meson-ge=
nerated_.._admin_protocol.c.o
| [294/1274] Linking static target src/node_device/libvirt_driver_nodedev_i=
mpl.a
| [295/1274] Compiling C object src/admin/libvirt_admin_driver.a.p/admin_se=
rver.c.o
| [296/1274] Linking static target src/security/libvirt_security_manager.a
| [297/1274] Compiling C object src/openvz/libvirt_openvz.a.p/openvz_conf.c=
.o
| [298/1274] Compiling C object src/qemu/libvirt_driver_qemu_impl.a.p/qemu_=
alias.c.o
| [299/1274] Compiling C object src/esx/libvirt_driver_esx.a.p/esx_network_=
driver.c.o
| [300/1274] Compiling C object src/hypervisor/libvirt_hypervisor.a.p/virho=
stdev.c.o
| [301/1274] Compiling C object src/qemu/libvirt_driver_qemu_impl.a.p/qemu_=
interop_config.c.o
| [302/1274] Compiling C object src/admin/libvirt_admin_driver.a.p/admin_se=
rver_dispatch.c.o
| [303/1274] Compiling C object src/lxc/libvirt_driver_lxc_impl.a.p/lxc_mon=
itor.c.o
| [304/1274] Compiling C object src/qemu/libvirt_driver_qemu_impl.a.p/qemu_=
hostdev.c.o
| [305/1274] Compiling C object src/lxc/libvirt_driver_lxc_impl.a.p/lxc_hos=
tdev.c.o
| [306/1274] Compiling C object src/qemu/libvirt_driver_qemu_impl.a.p/qemu_=
virtiofs.c.o
| [307/1274] Compiling C object src/esx/libvirt_driver_esx.a.p/esx_storage_=
backend_iscsi.c.o
| [308/1274] Compiling C object src/qemu/libvirt_driver_qemu_impl.a.p/qemu_=
qapi.c.o
...

You have to look at the ninja.build file to see that remote_daemon.c.o is n=
ot dependent on lxc_protocol.h
existing.  But, remote_driver.c.o does have the dependency.

I haven't sent it upstream yet.

Joe

> -----Original Message-----
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> Sent: Thursday, March 10, 2022 11:42 AM
> To: Slater, Joseph <joe.slater@windriver.com>
> Cc: meta-virtualization@lists.yoctoproject.org; MacLeod, Randy
> <Randy.MacLeod@windriver.com>
> Subject: Re: [meta-virtualization] [meta-virt][PATCH 1/1] libvert: modify
> dependencies on lxc_protocol.h
>=20
> s/libvert/libvirt/
>=20
> In message: [meta-virtualization] [meta-virt][PATCH 1/1] libvert: modify
> dependencies on lxc_protocol.h on 10/03/2022 Joe Slater wrote:
>=20
> > src/remote/meson.build does not create a dependency on the generated
> > lxc_protocol.h for remote_daemon.c.  Restructure how this file is
> > generated to allow the dependency.
>=20
> Can you document the configuration (i.e. packageconfigs, etc) that are ca=
using
> this ? I'm not seeing the same thing, so something different is going on.
>=20
> >
> > Signed-off-by: Joe Slater <joe.slater@windriver.com>
> > ---
> >  .../libvirt/libvirt/lxc_protocol.patch        | 104 ++++++++++++++++++
> >  recipes-extended/libvirt/libvirt_7.2.0.bb     |   1 +
> >  2 files changed, 105 insertions(+)
> >  create mode 100644
> > recipes-extended/libvirt/libvirt/lxc_protocol.patch
> >
> > diff --git a/recipes-extended/libvirt/libvirt/lxc_protocol.patch
> > b/recipes-extended/libvirt/libvirt/lxc_protocol.patch
> > new file mode 100644
> > index 00000000..595c3fe4
> > --- /dev/null
> > +++ b/recipes-extended/libvirt/libvirt/lxc_protocol.patch
> > @@ -0,0 +1,104 @@
> > +From 38af66c1a9c4cdeb256eeaf563c6807757c370ce Mon Sep 17 00:00:00
> > +2001
> > +From: Joe Slater <joe.slater@windriver.com>
> > +Date: Wed, 9 Mar 2022 23:17:33 +0000
> > +Subject: [PATCH] working commit
> > +
> > +remote_daemon.c and others need the generated header lxc_protocol.h,
> > +but do not have it as a dependency in meson.build.  This means that
> > +builds will randomly (ok, very occasionally) fail.  Restructure how
> > +the header is built so that remote_daemon can have it as a dependency.
> > +
> > +Upstream-Status: Pending
>=20
> Is there a link to the upstream submission ? That way we can follow along=
 ?
>=20
> Bruce
>=20
> > +
> > +Signed-off-by: Joe Slater <joe.slater@windriver.com>
> > +
> > +---
> > + src/remote/meson.build | 48
> > +++++++++++++++++++++++++------------------
> > + 1 file changed, 28 insertions(+), 20 deletions(-)
> > +
> > +diff --git a/src/remote/meson.build b/src/remote/meson.build index
> > +0a18826..31a30ee 100644
> > +--- a/src/remote/meson.build
> > ++++ b/src/remote/meson.build
> > +@@ -1,27 +1,11 @@
> > +-remote_driver_sources =3D [
> > +-  'remote_driver.c',
> > +-  'remote_sockets.c',
> > +-]
> > +-
> > +-remote_driver_generated =3D []
> > ++remote_xxx_generated =3D []
> > +
> > + foreach name : [ 'remote', 'qemu', 'lxc' ]
> > +-  client_bodies_h =3D '@0@_client_bodies.h'.format(name)
> > +   protocol_c =3D '@0@_protocol.c'.format(name)
> > +   protocol_h =3D '@0@_protocol.h'.format(name)
> > +   protocol_x =3D '@0@_protocol.x'.format(name)
> > +
> > +-  remote_driver_generated +=3D custom_target(
> > +-    client_bodies_h,
> > +-    input: protocol_x,
> > +-    output: client_bodies_h,
> > +-    command: [
> > +-      gendispatch_prog, '--mode=3Dclient', name, name.to_upper(), '@I=
NPUT@',
> > +-    ],
> > +-    capture: true,
> > +-  )
> > +-
> > +-  remote_driver_generated +=3D custom_target(
> > ++  remote_xxx_generated +=3D custom_target(
> > +     protocol_h,
> > +     input: protocol_x,
> > +     output: protocol_h,
> > +@@ -30,7 +14,7 @@ foreach name : [ 'remote', 'qemu', 'lxc' ]
> > +     ],
> > +   )
> > +
> > +-  remote_driver_generated +=3D custom_target(
> > ++  remote_xxx_generated +=3D custom_target(
> > +     protocol_c,
> > +     input: protocol_x,
> > +     output: protocol_c,
> > +@@ -42,6 +26,30 @@ foreach name : [ 'remote', 'qemu', 'lxc' ]
> > +   rpc_probe_files +=3D files(protocol_x)  endforeach
> > +
> > ++
> > ++remote_driver_sources =3D [
> > ++  'remote_driver.c',
> > ++  'remote_sockets.c',
> > ++]
> > ++
> > ++remote_driver_generated =3Dremote_xxx_generated
> > ++
> > ++foreach name : [ 'remote', 'qemu', 'lxc' ]
> > ++  client_bodies_h =3D '@0@_client_bodies.h'.format(name)
> > ++  protocol_x =3D '@0@_protocol.x'.format(name)
> > ++
> > ++  remote_driver_generated +=3D custom_target(
> > ++    client_bodies_h,
> > ++    input: protocol_x,
> > ++    output: client_bodies_h,
> > ++    command: [
> > ++      gendispatch_prog, '--mode=3Dclient', name, name.to_upper(),
> '@INPUT@',
> > ++    ],
> > ++    capture: true,
> > ++  )
> > ++
> > ++endforeach
> > ++
> > + remote_daemon_sources =3D files(
> > +   'remote_daemon.c',
> > +   'remote_daemon_config.c',
> > +@@ -49,7 +57,7 @@ remote_daemon_sources =3D files(
> > +   'remote_daemon_stream.c',
> > + )
> > +
> > +-remote_daemon_generated =3D []
> > ++remote_daemon_generated =3D remote_xxx_generated
> > +
> > + virt_ssh_helper_sources =3D files(
> > +   'remote_sockets.c',
> > +--
> > +2.32.0
> > +
> > diff --git a/recipes-extended/libvirt/libvirt_7.2.0.bb
> > b/recipes-extended/libvirt/libvirt_7.2.0.bb
> > index 5ad7d59e..04c66eb5 100644
> > --- a/recipes-extended/libvirt/libvirt_7.2.0.bb
> > +++ b/recipes-extended/libvirt/libvirt_7.2.0.bb
> > @@ -31,6 +31,7 @@ SRC_URI =3D "http://libvirt.org/sources/libvirt-
> ${PV}.tar.xz;name=3Dlibvirt \
> >             file://0002-meson-Fix-compatibility-with-Meson-0.58.patch \
> >             file://0001-security-fix-SELinux-label-generation-logic.pat=
ch \
> >
> > file://0001-storage_driver-Unlock-object-on-ACL-fail-in-storageP.patch
> > \
> > +           file://lxc_protocol.patch \
> >            "
> >
> >  SRC_URI[libvirt.md5sum] =3D "92044b629216e44adce63224970a54a3"
> > --
> > 2.35.1
> >
>=20
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#7084): https://lists.yoctoproject.org/g/meta-
> virtualization/message/7084
> > Mute This Topic: https://lists.yoctoproject.org/mt/89691200/1050810
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub
> [bruce.ashfield@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >


