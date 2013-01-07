Return-Path: <Lei.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 277CCE01423
	for <meta-virtualization@yoctoproject.org>;
	Sun,  6 Jan 2013 18:08:11 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r07285Mx009966
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 6 Jan 2013 18:08:05 -0800 (PST)
Received: from [128.224.158.164] (128.224.158.164) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Sun, 6 Jan 2013 18:08:04 -0800
Message-ID: <50EA2E1F.5010408@windriver.com>
Date: Mon, 7 Jan 2013 10:08:31 +0800
From: Lei Yang <lei.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: <lei.yang@windriver.com>, Joe MacDonald <Joe.MacDonald@windriver.com>
References: <1357449457-2669-1-git-send-email-lei.yang@windriver.com>
	<20130107014615.GD9356@windriver.com>
	<50EA2CE5.3070905@windriver.com>
In-Reply-To: <50EA2CE5.3070905@windriver.com>
X-Originating-IP: [128.224.158.164]
Cc: meta-virtualization@yoctoproject.org,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] Add netcat-openbsd for virtualization (libvirt virt-test)
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: lei.yang@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Jan 2013 02:08:11 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/07/2013 10:03 AM, Lei Yang wrote:
> On 01/07/2013 09:46 AM, Joe MacDonald wrote:
>> [[meta-networking][PATCH] Add netcat-openbsd for virtualization 
>> (libvirt virt-test)] On 13.01.06 (Sun 13:17) lei.yang@windriver.com 
>> wrote:
>>
>>> From: Lei Yang<lei.yang@windriver.com>
>>>
>>> The netcat-openbsd in meta-virtualization layer has bugs.
>>> This update version will fix "nc: Protocol no available." error.
>>> As bruce point, we want to keep netcat in the meta-networking,
>>> which meta-virtualization will depend on
>> That's fine with me if that works for him, and having both netcat
>> versions available is fine, I personally prefer the obsd one.  I'll keep

Do I need send a V2 for update the openbsd's priority ?

Lei

>> an eye out for your next version with the per-recipe alternative
>> priorities.
>>
>> I didn't notice the discussion with Bruce, though, so at the risk of
>> re-stating what you guys have already agreed upon, this will mean you're
>> at least going to be cloning meta-oe to use meta-virtualization.
>> meta-networking isn't a standalone layer for the most part.  I maintain
>> a read-only subtree project on github that is meta-networking separated
>> from the rest of meta-oe, but it necessarily trails the meta-networking
>> in meta-oe.
>
> Wait Bruce's comments
>
> Lei
>
>
>
>> I'm fine with the new recipe, just wanted to make sure you had all the
>> information you needed.
>> -J.
>>
>>> Lei
>>>
>>> Signed-off-by: Lei Yang<lei.yang@windriver.com>
>>> ---
>>>   .../recipes-support/netcat/netcat-openbsd_1.89.bb  |   29 
>>> ++++++++++++++++++++
>>>   meta-networking/recipes-support/netcat/netcat.inc  |    6 ++++
>>>   .../recipes-support/netcat/netcat_0.7.1.bb         |   11 +++----
>>>   3 files changed, 40 insertions(+), 6 deletions(-)
>>>   create mode 100644 
>>> meta-networking/recipes-support/netcat/netcat-openbsd_1.89.bb
>>>   create mode 100644 meta-networking/recipes-support/netcat/netcat.inc
>>>
>>> diff --git 
>>> a/meta-networking/recipes-support/netcat/netcat-openbsd_1.89.bb 
>>> b/meta-networking/recipes-support/netcat/netcat-openbsd_1.89.bb
>>> new file mode 100644
>>> index 0000000..9fe406c
>>> --- /dev/null
>>> +++ b/meta-networking/recipes-support/netcat/netcat-openbsd_1.89.bb
>>> @@ -0,0 +1,29 @@
>>> +require netcat.inc
>>> +DESCRIPTION = "OpenBSD Netcat"
>>> +HOMEPAGE = "http://ftp.debian.org"
>>> +LICENSE = "BSD-3-Clause"
>>> +PR = "r0"
>>> +
>>> +SRC_URI = 
>>> "${DEBIAN_MIRROR}/main/n/netcat-openbsd/netcat-openbsd_1.89.orig.tar.gz;name=netcat 
>>> \
>>> +           
>>> ${DEBIAN_MIRROR}/main/n/netcat-openbsd/netcat-openbsd_1.89-4.diff.gz;name=netcat-patch"
>>> +
>>> +SRC_URI[netcat.md5sum] = "7238ce15aae43069e96ba7faf03f153e"
>>> +SRC_URI[netcat.sha256sum] = 
>>> "72e844dde8a2a7cba61971d493758dbea9ef0b164bccef15fd4a36490dc77f2b"
>>> +SRC_URI[netcat-patch.md5sum] = "00c65aa22243b76998174c733cbb64cc"
>>> +SRC_URI[netcat-patch.sha256sum] = 
>>> "d5b6b2bd9788114bdcfbb71acad0263720b4fdc41529e287adf451b8610f84f1"
>>> +
>>> +S = "${WORKDIR}/${PN}-${PV}.orig"
>>> +
>>> +do_configure[noexec] = "1"
>>> +
>>> +do_compile() {
>>> +    cd ${S}
>>> +        while read line; do patch -p1<debian/patches/$line; 
>>> done<debian/patches/series
>>> +    pkgrel=4
>>> +    oe_runmake CFLAGS="$CFLAGS -DDEBIAN_VERSION=\"\\\"${pkgrel}\\\"\""
>>> +}
>>> +
>>> +do_install() {
>>> +        install -d ${D}${bindir}
>>> +        install -m 755 ${S}/nc ${D}${bindir}/nc.${BPN}
>>> +}
>>> diff --git a/meta-networking/recipes-support/netcat/netcat.inc 
>>> b/meta-networking/recipes-support/netcat/netcat.inc
>>> new file mode 100644
>>> index 0000000..4098668
>>> --- /dev/null
>>> +++ b/meta-networking/recipes-support/netcat/netcat.inc
>>> @@ -0,0 +1,6 @@
>>> +SECTION = "console/network"
>>> +inherit update-alternatives gettext
>>> +
>>> +ALTERNATIVE_${PN} = "nc"
>>> +ALTERNATIVE_PRIORITY = "100"
>>> +
>>> diff --git a/meta-networking/recipes-support/netcat/netcat_0.7.1.bb 
>>> b/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
>>> index c5ab85d..e09202b 100644
>>> --- a/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
>>> +++ b/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
>>> @@ -1,21 +1,20 @@
>>> +require netcat.inc
>>>   DESCRIPTION = "GNU Netcat"
>>>   HOMEPAGE = "http://netcat.sourceforge.net"
>>> -SECTION = "console/network"
>>>   LICENSE = "GPLv2"
>>>   LIC_FILES_CHKSUM = 
>>> "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>>>
>>> -PR = "r0"
>>> +PR = "r1"
>>>
>>>   SRC_URI = "${SOURCEFORGE_MIRROR}/netcat/netcat-${PV}.tar.bz2"
>>>
>>>   SRC_URI[md5sum] = "0a29eff1736ddb5effd0b1ec1f6fe0ef"
>>>   SRC_URI[sha256sum] = 
>>> "b55af0bbdf5acc02d1eb6ab18da2acd77a400bafd074489003f3df09676332bb"
>>>
>>> -inherit autotools update-alternatives gettext
>>> +inherit autotools
>>>
>>>   do_install_append() {
>>> -    mv ${D}${bindir}/nc ${D}${bindir}/nc.${PN}
>>> +        install -d ${D}${bindir}
>>> +        mv ${D}${bindir}/nc ${D}${bindir}/nc.${PN}
>>>   }
>>>
>>> -ALTERNATIVE_${PN} = "nc"
>>> -ALTERNATIVE_PRIORITY = "100"
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization


