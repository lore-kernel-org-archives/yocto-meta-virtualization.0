Return-Path: <B43198@freescale.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 00BA3E00779; Wed, 11 Mar 2015 01:14:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [157.56.110.103 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bn0103.outbound.protection.outlook.com [157.56.110.103])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1F65DE00754
	for <meta-virtualization@yoctoproject.org>;
	Wed, 11 Mar 2015 01:14:37 -0700 (PDT)
Received: from [10.171.74.27] (192.88.166.1) by
	BY2PR03MB189.namprd03.prod.outlook.com (10.242.36.140) with Microsoft
	SMTP Server (TLS) id 15.1.93.16; Wed, 11 Mar 2015 08:14:33 +0000
Message-ID: <54FFF953.5020103@freescale.com>
Date: Wed, 11 Mar 2015 10:14:11 +0200
From: Purcareata Bogdan <b43198@freescale.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Bogdan Purcareata
	<bogdan.purcareata@freescale.com>
References: <1425989489-458-1-git-send-email-bogdan.purcareata@freescale.com>
	<CADkTA4PhnTZQ5FQqvmc7Y8J9BT+tHqpbg4JUTrgKyjS4q0KV-Q@mail.gmail.com>
In-Reply-To: <CADkTA4PhnTZQ5FQqvmc7Y8J9BT+tHqpbg4JUTrgKyjS4q0KV-Q@mail.gmail.com>
X-Originating-IP: [192.88.166.1]
X-ClientProxiedBy: HE1PR08CA0028.eurprd08.prod.outlook.com (25.161.112.38) To
	BY2PR03MB189.namprd03.prod.outlook.com (10.242.36.140)
Authentication-Results: yoctoproject.org; dkim=none (message not signed)
	header.d=none;
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:BY2PR03MB189;
X-Forefront-Antispam-Report: BMV:0; SFV:NSPM;
	SFS:(10019020)(6009001)(6049001)(377454003)(24454002)(51704005)(46102003)(33656002)(19580395003)(54356999)(87976001)(77156002)(19580405001)(65816999)(59896002)(66066001)(80316001)(77096005)(122386002)(2950100001)(40100003)(36756003)(42186005)(47776003)(86362001)(65956001)(92566002)(50466002)(76176999)(64126003)(50986999)(23676002)(65806001)(15975445007)(42262002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY2PR03MB189; H:[10.171.74.27];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Antispam-PRVS: <BY2PR03MB1897470177F6C12C6B69BC485190@BY2PR03MB189.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5001009)(5005006); SRVR:BY2PR03MB189; 
X-Forefront-PRVS: 0512CC5201
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:;SRVR:BY2PR03MB189;
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2015 08:14:33.3654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR03MB189
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 2/3] lxc: Add PACKAGECONFIG for seccomp
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Mar 2015 08:14:40 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 10.03.2015 19:08, Bruce Ashfield wrote:
> On Tue, Mar 10, 2015 at 8:11 AM, Bogdan Purcareata
> <bogdan.purcareata@freescale.com> wrote:
>> Determine whether libseccomp is installed in the Yocto image, and based on that,
>> compile the necessary support for LXC as well.
>>
>> Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
>> ---
>>   recipes-containers/lxc/lxc_1.0.7.bb | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/recipes-containers/lxc/lxc_1.0.7.bb b/recipes-containers/lxc/lxc_1.0.7.bb
>> index c618c84..4110ac5 100644
>> --- a/recipes-containers/lxc/lxc_1.0.7.bb
>> +++ b/recipes-containers/lxc/lxc_1.0.7.bb
>> @@ -43,12 +43,14 @@ EXTRA_OECONF += "--with-distro=${DISTRO} ${PTEST_CONF}"
>>
>>   PACKAGECONFIG ??= "templates \
>>       ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
>> +    ${@base_contains('IMAGE_INSTALL', 'libseccomp', 'seccomp', '', d)} \
>
> This doesn't seem correct, or at least not in the spirit of other
> package config options
> and tests that I've used (and seen). But if you know of a reference
> that looks like this,
> point me in its direction and I'll have a look.
>
> Testing on distro features is one thing, as would be image features ..
> but IMAGE_INSTALL
> is not the same, and isn't always used.
>
> Part of the package config is to trigger both depends and rdepends on
> other packages
> when it is enabled. In this case, we are doing the opposite, using the
> dependency to
> trigger the package config.
>
> Either this test needs to be patched into the lxc configuration phase,
> so it can detect
> it at runtime, or just leave it at a package config option. Your
> layers can then enable
> that packageconfig and everything works as expected, and we don't
> force all users
> to enable this in lxc when they may not want it simply because
> libseccomp is present.

I understand, thank you for making it clear.

I don't have a strong argument for my patch, so I think the best option 
for now would be to leave the PACKAGECONFIG option only, and let the 
layers or image configuration file handle what's active at build time.

I will send a v2.

Best regards,
Bogdan P.

> Bruce
>
>>   "
>>   PACKAGECONFIG[doc] = "--enable-doc --enable-api-docs,--disable-doc --disable-api-docs,,"
>>   PACKAGECONFIG[rpath] = "--enable-rpath,--disable-rpath,,"
>>   PACKAGECONFIG[apparmour] = "--enable-apparmor,--disable-apparmor,apparmor,apparmor"
>>   PACKAGECONFIG[templates] = ",,, ${PN}-templates"
>>   PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,libselinux"
>> +PACKAGECONFIG[seccomp] ="--enable-seccomp,--disable-seccomp,libseccomp,libseccomp"
>>
>>   inherit autotools pkgconfig ptest update-rc.d systemd
>>
>> --
>> 2.1.4
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>

