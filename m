Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 771E0C54E60
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 11:10:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.14026.1710328211558606659
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 13 Mar 2024 04:10:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=CrLlhufN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=38026f99e1=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42DAoRba011264;
	Wed, 13 Mar 2024 11:10:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=3uPoHaAN/IRL3Anj2C8e32v6VDwJoYAsEX8cvISwnAc=; b=
	CrLlhufNrAFwQh9XFI1F8PW5lLzHrrgwIp6nL9T908A23xdJdSF5ISGpWQJ+jBce
	xN9Bbk/B25PB7t9lCtsT2hknKsOgyqbioDl9jD3Aq30Y/sz2raiVw/gpnnI6qVP/
	aKWx+DooX82cbZq1FNA67V4IDeozmFOQzjMfPDcdkTdsh2GG0i6ldxA4sL+1eR2k
	QlUkrnhISmTwdcL8vuU3k7Ca4+wB+lADzreLeKv36lWmD8WyRGCM+OQdICzQa1pJ
	zPNpZooIBHYrL/wx0UFVGHah6uTg3z5KgcmTLtmtNs3BotYhkksJVv3Y/RmWjaJ9
	TNsrlQn4f8LlV2d6yKy8oQ==
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2169.outbound.protection.outlook.com [104.47.73.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wrcyxuy0f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Mar 2024 11:10:09 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cxP+zICLBX7BhjJHcNNviozWGkSQ2DnJEWHrNOe3UxWS535BfU7gE/JdADXtVgb2bb+7vIVwun2EwLEQTUaPZR7oOsnkSjWprey39OTzgSivpa7S6fPYE3HGHc4zOuzyG/Mv2c+Ph0kpzqnXzdTHqGKlMR8pjAFB8NNbPjo2PaSj7LiW4o7RT8tz3pKzlq1CVXjVLjkklZkBhAg4tHgCVHeewAE/427GKrJ9o6WZcJAG5Bx0LeZpTSdWlCPeYi1Ur7UnMt29/79ipO2J4UyXkiw0sAg08AFWeJxjO09tC45gO92B95snbD2AxFCbQfqWvIHpA7NVDjz7/8ImfImxaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3uPoHaAN/IRL3Anj2C8e32v6VDwJoYAsEX8cvISwnAc=;
 b=Z8MPCmxwW5u3DJc7b7tj7CDHDnN252KC9pM8eS6RHBlcR3mKTv9Xk/K1UDuvabppfIB5vl0oNfVa/34y2C055yaA+1x9JpBKE1M+9+knEdR3/WT5K5wHXkb0FSn9fLyX08EnrI3b99FFQHRl3DzGJpKdIPmHlD/XIs7BElSp8H5DuRJNMZs68QXPKHI89AknfKJ/ufmBrVZwFzTlaq5LgxbXd1OgbUCAFJwfgdtSKPQ7o8noiH8m9w7kydFMZrpbis2sKOkivCRuL0GLbK1Y15LHWSUjlMVXPgOfERsMySzMQRnjyPJFIDK2OI49D9tHxDVPMTJJv0aJwvXgJ85ALQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SJ1PR11MB6107.namprd11.prod.outlook.com (2603:10b6:a03:48a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20; Wed, 13 Mar
 2024 11:10:06 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7bce:b7a0:1830:98d0]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7bce:b7a0:1830:98d0%5]) with mapi id 15.20.7386.017; Wed, 13 Mar 2024
 11:10:06 +0000
Message-ID: <d5bcf330-2b3e-d5e9-1b49-db88383ea7b4@windriver.com>
Date: Wed, 13 Mar 2024 19:09:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [meta-virtualization] ceph upgrade
Content-Language: en-US
To: bruce.ashfield@gmail.com,
        Christopher Clark <christopher.w.clark@gmail.com>
Cc: Tim Orling <ticotimo@gmail.com>,
        meta-virtualization <meta-virtualization@lists.yoctoproject.org>
References: <17BA0B9342C35A1E.21429@lists.yoctoproject.org>
 <CADkTA4M9w2W+7Cio6x2DBsHf+i6TPtrodVB4p5it_oGbh0bO-w@mail.gmail.com>
 <CANx9H-B2RS3CP6xg+R3QFCYUO0a6NYTzAgjhaJuoWRjw8dq2jA@mail.gmail.com>
 <CADkTA4Nu=+-2Vj16G=v_tMoL+Z+SKOaMSM9VzfD5jkf0XqcUSw@mail.gmail.com>
 <CACMJ4Ga8A-nkYq6BcyWF9Ar9NTKePaqmmkj7ii0wMkS8g1770A@mail.gmail.com>
 <CADkTA4M1_a+E11jTbFQTuxvUaPR=+TE+rNOo4+46B3f4_ed8Bg@mail.gmail.com>
 <17BC4D73EFF2649F.27213@lists.yoctoproject.org>
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <17BC4D73EFF2649F.27213@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG2P153CA0033.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::20)
 To CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SJ1PR11MB6107:EE_
X-MS-Office365-Filtering-Correlation-Id: c01f6ed8-6eea-4fe6-5094-08dc434e2395
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	13Od4bIdAQCc4QvzO9A8L/1MGk1VaiNY8UVi9vJubcTA8vcvAneloTCrMJjMP6D54Qy/AY/Ym1/ByA+sNXEPy2uOrLWH+xY8bnLnvYsKius+7W1DrzYNWmO1AF5IcOGwg9+9YvIqHDPiSrZIMqjFeOuptE19TIOnCC/p1VYANdXoD+XCnDUrIxViYrxJhBItEjuWKG6uLWb1ceT5OB5tRsDzkRgvE+kyByToYYlZ7ghjAdD4zmIsrbG5FqM+LrZxhs9+5GWqbnQ+k09LVZZm7BlBrPBnM4TUeQFcFtKpK5gbvYf7i9TjhDJmCppYyiMjKJLfm8iTukHvFGJyw8kNyvoj6n/Rd4+cB1TBTVl+b9j/N1qq0g7XjQTApXkazmuqlZedMDw5d9MM1LOJAtIY3uuXB2ZO8SYZoijTDJQEXLh+QAd+hW/un7s2PhkWklEl4k3qTGPOzkBe79RwlnEZzHiZ7fiYZF/dueo0evO8yOv/qYVjuERYq/OGxh0udxcDCKR5Wib5pN0yjnHAxB1AH+Yb8fb9NR+Q9P3Ypg54njXDrD5eh5E6EIFfA3mpHemVilZcZJJjEZHpciKKXSH9AOWPAII6aOXFGhsQPAFn42w=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Mm1QZXZBdlZ1RGlKWjlqSVRjdXdIK1QzYzlYOEU2ZFV6TDhRUndVRUROaVFX?=
 =?utf-8?B?TDVSTWtmb2JVZEdUTHdYcXgrRG5uU0h2RnovYWNObTlWSllrdVFmYWlxS3dM?=
 =?utf-8?B?U1JSVTdpTEphMENZczRCb2daUlVmeXpRbU9leVFiTHFvbnFqQTZOYXNkZFps?=
 =?utf-8?B?L01iZVVJR25wdG02MmcrNmJTU3Q2ek0zZkp4Z2thUUJhRUlhbzcyU1Q0eHoz?=
 =?utf-8?B?WjVvSFVjMDhUM1NNZUdVRG9kdWJNWkJSYU0wN3lSNHpXRFhjN0hIcjkyUjI0?=
 =?utf-8?B?VlkwUW1qU3Y0dytDbzNCNDMyY2ZVa2dyRGVWSjVtSit2eHNPMUk1TE1xRzFR?=
 =?utf-8?B?VUNKeHI3UDkwZ0xlMVdTdE5TYy9Ga1pweDlLY255VFFaRjcvNFRqU0NLKzUv?=
 =?utf-8?B?VnR6ZkRoU3FKMUtyUGdwTmgzUVEybTUxUVplRnJhc2VOeXU0emJsdUhGQ2Ny?=
 =?utf-8?B?Z2pjMmlRYS9QQXVJZHo3U0hQR0o2aHBJcys1SG8rT0s2bVRaRzJnbjRrNnpq?=
 =?utf-8?B?RGJMSlFOaDNXWmZjY3BnYWpnY08xTGFGSmM4WWd2eFBZakF0dk5HTlFkZ3dB?=
 =?utf-8?B?UEVxTE9vc3JCSVlzU2FzNW9EMGFqdVYwMmxSL1NFNlNQVFFIbmVNY0FkRnJp?=
 =?utf-8?B?OTRoamFqalVHUEZHM2hnMnZnbThyOHFTakVDcXU2c01RK3FmeGxkb0dFTG9J?=
 =?utf-8?B?bEljYlJIWHhiWUtpbUZ2RzNGeVZrSHRHVkdXV1FsWGhwVjUxY2xkSU0xRVpN?=
 =?utf-8?B?dGd4eUFlell5ZHRIODdSd09VaGYxL0IzZU5IN3ZmZlpoSXNGazVDZTRFa1Yr?=
 =?utf-8?B?ZnA5V3JWaGF0clFDTXFJQmVybG1kS0hBc0tGSVhlN1JQazdwTHZIc1NOcnRU?=
 =?utf-8?B?dXdrdjFERVFPaDVyUU5iN2JJVG5TdHZtTWtML2U3elF4N0NFejlnaFB0N3dE?=
 =?utf-8?B?Z0tVWC95L1AyZ3VYendrZWZ1ZXRLdG9VWFdOOFIwQkhSck9uOGpPRUxYd2ZB?=
 =?utf-8?B?RXpieS9wSFR1aUFEQVh6eVF5bmVDN1lsOTRuMVB0VkFlaVJlTHIrVVhldGh3?=
 =?utf-8?B?dkY4WHJGeGhwZk5WR1NHZmh3ZE1QOS9sL215OFRsZjBzSFVqUHh2STdBd1VU?=
 =?utf-8?B?M3dpbnIxb2NHUUk3Z3hVVUoyOGJOUFZKYlVVb3BGWjJ3OVd6Nm0rajlSVmFZ?=
 =?utf-8?B?Q1JZaWt4NHduNFV2Vmh4RC9uYStsek9ody9vVnlpNEtMSmd5a0krVFBiYmRT?=
 =?utf-8?B?SHlvcVBhMjFOZzJHVUI2UEdxdlRyaVdRWXczRE5TNUttSHF4K3JHOXd2ZXJQ?=
 =?utf-8?B?bjBRZWp5T0lHNkFEd0lQMWRDVWZUVWg4b3VWL2xWcTRENitLczFEaDdyUDRw?=
 =?utf-8?B?T003bUQ2OUxtVE1ra2lleENLZlFIZElCRkcxV0RuR3l0QWxKVVFnUXB2TVFF?=
 =?utf-8?B?RHF2ZVMxS2JnZFExUUZoTnhLTGRqZEo3VHhLRFFJVGFZTjhnZ1kvYWtlcTlX?=
 =?utf-8?B?VTBMTmlJMEI0Kzl2Yy8rNENXUW9PMW5nTHhFZWY0RXc1RkNFS3pLTHhjRURt?=
 =?utf-8?B?dmJ2NUE1RkFUS3BDY01PRXllTHBtbWRIMGcvS0pSVDZGQUF6V3pzWnpqR2Ez?=
 =?utf-8?B?ajIvbDR2alZGNVpMdWkrYmszZm1ybHBtdEtIajN4bEJqMHhra0Y3UEZEQWF5?=
 =?utf-8?B?Q2JWaEJ3VEN1ZUNvR21nVFdkT0t0Q0pqYWoxbmlxdFV3cnlMbUllWmRUbWlD?=
 =?utf-8?B?YVpGNlQwMkQ3S2l1VXBJQ1JUbVRoWlBBWnlhd2ljaHZBQ3VGRUtMZU9hLzJ1?=
 =?utf-8?B?djJrM0IvS29hWmdrZ3RYQ25Dc094NzNIV0FJY2c1SHlzQlozVWkrLzdFVHhu?=
 =?utf-8?B?WGFuVllPM01WU3VScUU4bW5QNTB1Ulg4ajQ2aG51MFdIYm5RYkdNbWpjeFRP?=
 =?utf-8?B?VVZ0RndBdHpkK2ZjMlN2STdLZHZLRmlXN1NwS0p3UHdPeXlha1U2dEF0RGVS?=
 =?utf-8?B?d2pIa3hHSTYwVnh1eHF1YXFjNHJidW9EY0RwZ0l6blRGWGZ2Uk1FQjA1R3Y3?=
 =?utf-8?B?ZVUxeDR6TDhONVJCdHBiZ2xsK0JtMjdHdVF6enNZdGNMOExwY0E2TEYwQzI2?=
 =?utf-8?Q?KDYo/gCS++YMvKZ6pELd2RJrU?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c01f6ed8-6eea-4fe6-5094-08dc434e2395
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2024 11:10:06.4038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kThnlJ3AEjw+yBmrq6evweMJVMU6pv4IlA/+FZ+l/R7BLL0VEVyGgWHQsz3XnAPLBCQQpXBKula/3Qpv4cvnLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6107
X-Proofpoint-GUID: TQ2A2Rv_freq9UJjJLCQ4KYfUKwT2ahN
X-Proofpoint-ORIG-GUID: TQ2A2Rv_freq9UJjJLCQ4KYfUKwT2ahN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-13_07,2024-03-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=977 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0
 phishscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403130083
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 42DAoRba011264
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 13 Mar 2024 11:10:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8634

I found the install and packaging issues easy to fix. So I spend a=20
little more time.
The patch has been sent out.

There are still some package_qa issues as shown below:

WARNING: ceph-18.2.0-r0 do_package_qa: QA Issue: File=20
/usr/bin/cephfs-top in package ceph contains reference to TMPDIR
File /usr/sbin/cephadm in package ceph contains reference to TMPDIR=20
[buildpaths]
ERROR: ceph-18.2.0-r0 do_package_qa: QA Issue: ceph: /usr/bin/cephfs-top=20
maximum shebang size exceeded, the maximum size is 128.
ceph: /usr/sbin/cephadm maximum shebang size exceeded, the maximum size=20
is 128. [shebang-size]
ERROR: ceph-18.2.0-r0 do_package_qa: QA Issue: /usr/bin/cephfs-top=20
contained in package ceph requires=20
/ala-lpggp72/qichen/Yocto/builds/build-poky/tmp/work/core2-64-poky-linux/=
ceph/18.2.0/recipe-sysroot-native/usr/bin/python3-native/python3,=20
but no providers found in RDEPENDS:ceph? [file-rdeps]
WARNING: ceph-18.2.0-r0 do_package_qa: QA Issue: File=20
/usr/lib/python3.12/site-packages/cephfs.cpython-312-x86_64-linux-gnu.so=20
in package ceph-python contains reference to TMPDIR
File=20
/usr/lib/python3.12/site-packages/rbd.cpython-312-x86_64-linux-gnu.so in=20
package ceph-python contains reference to TMPDIR
File=20
/usr/lib/python3.12/site-packages/rados.cpython-312-x86_64-linux-gnu.so=20
in package ceph-python contains reference to TMPDIR
File=20
/usr/lib/python3.12/site-packages/rgw.cpython-312-x86_64-linux-gnu.so in=20
package ceph-python contains reference to TMPDIR
File=20
/usr/lib/python3.12/site-packages/ceph_volume-1.0.0-py3.12.egg-info/depen=
dency_links.txt=20
in package ceph-python contains reference to TMPDIR [buildpaths]
ERROR: ceph-18.2.0-r0 do_package_qa: QA Issue: -dev package ceph-dev=20
contains non-symlink .so '/usr/lib/libcephsqlite.so' [dev-elf]
WARNING: ceph-18.2.0-r0 do_package_qa: QA Issue: File=20
/usr/lib/python3.12/site-packages/.debug/cephfs.cpython-312-x86_64-linux-=
gnu.so=20
in package ceph-dbg contains reference to TMPDIR
File=20
/usr/lib/python3.12/site-packages/.debug/rbd.cpython-312-x86_64-linux-gnu=
.so=20
in package ceph-dbg contains reference to TMPDIR
File=20
/usr/lib/python3.12/site-packages/.debug/rados.cpython-312-x86_64-linux-g=
nu.so=20
in package ceph-dbg contains reference to TMPDIR
File=20
/usr/lib/python3.12/site-packages/.debug/rgw.cpython-312-x86_64-linux-gnu=
.so=20
in package ceph-dbg contains reference to TMPDIR [buildpaths]
ERROR: ceph-18.2.0-r0 do_package_qa: Fatal QA errors were found, failing=20
task.
ERROR: Logfile of failure stored in:=20
/ala-lpggp72/qichen/Yocto/builds/build-poky/tmp/work/core2-64-poky-linux/=
ceph/18.2.0/temp/log.do_package_qa.3746018
ERROR: Task=20
(/ala-lpggp72/qichen/Yocto/poky/meta-virtualization/recipes-extended/ceph=
/ceph_18.2.0.bb:do_package_qa)=20
failed with exit code '1'

Regards,
Qi


On 3/13/24 18:51, Chen Qi via lists.yoctoproject.org wrote:
> Hi Bruce,
>
> I looked into this ceph issue this afternoon. Now I can make=20
> do_compile pass.
> There's still some do_install issue, but I really need to head home now.
> I'll send out my patch soon.
>
> Regards,
> Qi
>
>
> On 3/13/24 02:43, Bruce Ashfield via lists.yoctoproject.org wrote:
>> On Tue, Mar 12, 2024 at 1:58=E2=80=AFPM Christopher Clark
>> <christopher.w.clark@gmail.com> wrote:
>>> On Mon, Mar 11, 2024 at 6:56=E2=80=AFPM Bruce Ashfield=20
>>> <bruce.ashfield@gmail.com> wrote:
>>>> On Mon, Mar 11, 2024 at 8:41=E2=80=AFPM Tim Orling <ticotimo@gmail.c=
om> wrote:
>>>>> On Mon, Mar 11, 2024 at 2:11=E2=80=AFPM Bruce Ashfield=20
>>>>> <bruce.ashfield@gmail.com> wrote:
>>>>>> Hi all,
>>>>>>
>>>>>> I'm still looking for help with this.
>>>>>>
>>>>>> It's all fine and well that folks have packages that they are
>>>>>> interested in more than others, but it needs to be more than
>>>>>> maintainers that step up and fix the niche packages.
>>>>>>
>>>>>> I'm still holding the meta-virt master-next -> master push until=20
>>>>>> Ceph
>>>>>> is upgraded and working.
>>>>>>
>>>>>> I know absolutely nothing about CMake, so I'm flailing around in t=
he
>>>>>> build of Ceph and have gotten no further since I last asked for=20
>>>>>> help.
>>>>> Well I did try, but I am no CMake expert nor ceph expert either. I=20
>>>>> got stalled on it detecting =E2=80=9Cthrift=E2=80=9D in one of the =
vendored=20
>>>>> libraries.
>>>> I ended up with that as well (just a few minutes ago), I tried setti=
ng
>>>> some Thrift variables, but it refuses to detect those as well.
>>>>
>>>> The errors seem to rotate .. and it isn't even obvious if some are
>>>> really fatal, or not.
>>>>
>>>> Perhaps it just isn't something that cross builds anymore, and I'll
>>>> just blacklist it with the broken
>>>> recipe.
>>>>
>>>> I'll have one more try with it tomorrow before giving up.
>>> Hi Bruce, Tim,
>>>
>>> I had a look at this yesterday, and I (possibly?) made some progress
>>> with it but wanted to ask before getting too far with an approach:
>>> would it be OK to pull out at least some of those vendored components
>>> into some new separate recipes, so that rebuilding that compile stage
>>> when it needs it is faster?
>>>
>> I'm fine with stripping it down to the bare minimum to be buildable.
>>
>> I'd rather have a building (but small) recipe, and then we can see if=20
>> there's
>> demand for more components.
>>
>> I was also poking at this today, and I'm still seeing dramatically=20
>> different
>> results when I call compile multiple times .. all the way back to cmak=
e
>> complaining it can't find the python3 interpreter, which was a problem
>> I thought I had solved!
>>
>> Feel free to grab me on the #meta-virt channel if you have any=20
>> interactive
>> questions.
>>
>> Bruce
>>
>>> Christopher
>>>
>>>
>>>> Bruce
>>>>
>>>>> We can only take so much abuse from upstream ;)
>>>>>
>>>>>
>>>>>> Bruce
>>>>>>
>>>>>> On Tue, Mar 5, 2024 at 9:22=E2=80=AFPM Bruce Ashfield via
>>>>>> lists.yoctoproject.org
>>>>>> <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>>>>>>> Hi all,
>>>>>>>
>>>>>>> If anyone has experience with Cmake, I could use a hand=20
>>>>>>> completing the
>>>>>>> ceph upgrade that is marked as WIP in master-next.
>>>>>>>
>>>>>>> It took me a few hours today, but I managed to get past python3
>>>>>>> detection issues, but now I'm running into a compiler test failur=
e
>>>>>>> during the build.
>>>>>>>
>>>>>>> To me, it looks like our sysroot isn't being passed, which could =
be
>>>>>>> related to the toolchain.cmake not being used (since the=20
>>>>>>> compiler test
>>>>>>> is being launched by a sub component).
>>>>>>>
>>>>>>> I'm inclined to be stubborn about this, and keep working on getti=
ng
>>>>>>> the package bumped, as it has missed a few upgrades and is in=20
>>>>>>> need of
>>>>>>> some love.
>>>>>>>
>>>>>>> Bruce
>>>>>>>
>>>>>>> --=20
>>>>>>> - Thou shalt not follow the NULL pointer, for chaos and madness=20
>>>>>>> await
>>>>>>> thee at its end
>>>>>>> - "Use the force Harry" - Gandalf, Star Trek II
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>
>>>>>> --=20
>>>>>> - Thou shalt not follow the NULL pointer, for chaos and madness=20
>>>>>> await
>>>>>> thee at its end
>>>>>> - "Use the force Harry" - Gandalf, Star Trek II
>>>>>>
>>>>>>
>>>>>>
>>>>
>>>> --=20
>>>> - Thou shalt not follow the NULL pointer, for chaos and madness awai=
t
>>>> thee at its end
>>>> - "Use the force Harry" - Gandalf, Star Trek II
>>>>
>>>>
>>>>
>>
>>
>>
>>
>>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8632): https://lists.yoctoproject.org/g/meta-virtua=
lization/message/8632
> Mute This Topic: https://lists.yoctoproject.org/mt/104759213/3618072
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub=
 [Qi.Chen@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


