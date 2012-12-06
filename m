Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3EA80E0143A
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 06:23:09 -0800 (PST)
Received: by mail-lb0-f176.google.com with SMTP id k6so5731444lbo.35
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Dec 2012 06:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=WTF7R1Jh+q8hVGAYe8yFijANLGGGeH2b41JxOoGngEQ=;
	b=JzoKh0O14q8Z02tlqUs1WTTbfhFOOmPNqe0K99PSH0LAqQZIGj8pNzuQX4Uf7v+9Vm
	Ys9T1MgdMhreGmAHn99LBESh5cJPj2JZ7C7rkAINr/WxZS4ogqg1dLQF2Z7ngeoMnnXX
	eNqVJyxjmj+oSVd1pDxBB8l7hBQZ1gnYU8EmE5smH7QnBtQKXCh91Ldnsh1VpLIA2ifO
	AZ+92b4pJCQY7PU4ImF90Isc4cKVogz+3IPjSkpKCb7rix0luOvGxKSQO1Ctb/ajjtXE
	m2I77MkZcn7d04zY72dfxhhCgF6TcS9kvXeEFyg3xTRdwVX/I+8h4jgSyWGjCVJHE5+E
	1iLw==
Received: by 10.112.84.168 with SMTP id a8mr941337lbz.75.1354803787985;
	Thu, 06 Dec 2012 06:23:07 -0800 (PST)
Received: from [172.16.140.28] (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id l1sm3573964lbm.1.2012.12.06.06.23.06
	(version=SSLv3 cipher=OTHER); Thu, 06 Dec 2012 06:23:07 -0800 (PST)
Message-ID: <50C0AA48.1040508@gmail.com>
Date: Thu, 06 Dec 2012 15:23:04 +0100
From: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.c.nystrom@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1354802601-10840-1-git-send-email-david.c.nystrom@gmail.com>
	<1354802601-10840-7-git-send-email-david.c.nystrom@gmail.com>
	<CADkTA4NZfY+P=2U7jdk4wY-SFJP-Ns4MMDtauy=HorkFRNHyWg@mail.gmail.com>
In-Reply-To: <CADkTA4NZfY+P=2U7jdk4wY-SFJP-Ns4MMDtauy=HorkFRNHyWg@mail.gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCHv3 06/14] Added openbsd-netcat recipe, libvirt dependency
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
X-List-Received-Date: Thu, 06 Dec 2012 14:23:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 12/06/2012 03:20 PM, Bruce Ashfield wrote:
> On Thu, Dec 6, 2012 at 9:03 AM, <david.c.nystrom@gmail.com> wrote:
>
>> From: David Nyström <david.nystrom@enea.com>
>>
>> ---
>>   recipes-networking/netcat/openbsd-netcat_1.6.bb |   29
>> +++++++++++++++++++++++
>>   1 file changed, 29 insertions(+)
>>   create mode 100644 recipes-networking/netcat/openbsd-netcat_1.6.bb
>>
>
> Random comment. I was surprised that this wasn't already in the
> meta-networking
> layer, so I went to have a look. And indeed I don't see it.
>
> Is that consistent with what other people see ? This seems like it could go
> in another
> layer at some point.
>
> At a glance, I'm not seeing the libvirt dependency. Am I overlooking it
> somehow ?
>
> Cheers,
>
> Bruce
>

A good explanation is here:
https://bugs.archlinux.org/task/22068

>
>>
>> diff --git a/recipes-networking/netcat/openbsd-netcat_1.6.bbb/recipes-networking/netcat/
>> openbsd-netcat_1.6.bb
>> new file mode 100644
>> index 0000000..1ae3f37
>> --- /dev/null
>> +++ b/recipes-networking/netcat/openbsd-netcat_1.6.bb
>> @@ -0,0 +1,29 @@
>> +DESCRIPTION = "OpenBSD Netcat"
>> +HOMEPAGE = "http://code.google.com/p/openbsd-netcat/"
>> +SECTION = "console/network"
>> +LICENSE = "BSD-3-Clause"
>> +PR = "r0"
>> +
>> +SRCREV = "5"
>> +
>> +SRC_URI = "svn://
>> openbsd-netcat.googlecode.com/svn;module=trunk;protocol=http"
>> +S = "${WORKDIR}/trunk"
>> +
>> +inherit update-alternatives gettext
>> +
>> +do_configure[noexec] = "1"
>> +
>> +do_compile() {
>> +       cd ${S}
>> +       oe_runmake
>> +}
>> +
>> +do_install() {
>> +       install -d ${D}${bindir}
>> +       install -m 755 ${S}/nc ${D}${bindir}/nc.${BPN}
>> +}
>> +
>> +ALTERNATIVE_${PN} = "nc"
>> +ALTERNATIVE_PRIORITY = "101"
>> +
>> +BBCLASSEXTEND = "nativesdk"
>> --
>> 1.7.9.5
>>
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>
>
>
>


