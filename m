Return-Path: <Haitao.Liu@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 88CD0E00D81; Tue, 19 Dec 2017 01:29:07 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6A3BEE00CFF
	for <meta-virtualization@yoctoproject.org>;
	Tue, 19 Dec 2017 01:29:06 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vBJ9T2tG027053
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 19 Dec 2017 01:29:02 -0800 (PST)
Received: from [128.224.162.172] (128.224.162.172) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 19 Dec 2017 01:29:01 -0800
To: <mark.asselstine@windriver.com>
References: <1513648689-92598-1-git-send-email-haitao.liu@windriver.com>
	<CAPuovEKHtgbGtKDiogu6u1wp1Ct5h=36G_T6rrSpC1LzfXvkbw@mail.gmail.com>
From: Haitaoliu <Haitao.Liu@windriver.com>
Message-ID: <ab20c1f5-1d5b-bc58-d6b0-9e0e495a9507@windriver.com>
Date: Tue, 19 Dec 2017 17:27:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAPuovEKHtgbGtKDiogu6u1wp1Ct5h=36G_T6rrSpC1LzfXvkbw@mail.gmail.com>
X-Originating-IP: [128.224.162.172]
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] lxc: Disable the bind-interfaces for lxc.
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
X-List-Received-Date: Tue, 19 Dec 2017 09:29:07 -0000
Content-Type: multipart/alternative;
	boundary="------------8D931598BC6FAC3644CC32F0"
Content-Language: en-US

--------------8D931598BC6FAC3644CC32F0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2017年12月19日 11:14, Mark Asselstine wrote:
> On Mon, Dec 18, 2017 at 8:58 PM, Liu Haitao <haitao.liu@windriver.com> wrote:
>> When enable lxc service it failed with the following errors:
>>
>> """
>> root@intel-x86-64:~# /usr/libexec/lxc/lxc-net start
>>
>>       dnsmasq: cannot set --bind-interfaces and --bind-dynamic
>>       Failed to setup lxc-net.
>> """
>>
>> It said that the "bind-interfaces" and "bind-dynamic" cannot cooperate together.
>> These two options have the same fundamental capacity of binding network interfaces.
>>
>> So dnsmasq just require one of this kind of option.
>>
>> For some reason ,the following commit  compulsively add the "bind-dynamic" option
>> for dnsamsq.
>>
>> """
>>          c3c4d977cbb51363f9030c2e39d56a772b29f73b
>> """
> It is not for "some reason", it is for a specific reason that is
> explained in detail in the commit log and in the comment that goes
> with the setting. Libvirt will have issues setting up virbr0 if we do
> not use 'bind-dynamic'.
>
> Now you aren't touching the dnsmasq.conf file which is good since you
> will not be breaking libvirt with this change but I will have to take
> a closer look at your approach to see if it valid for lxc-net. Really
> we should move the 'bind-dynamic' into a libvirt specific
> sub-configuration file in /etc/dnsmasq.d/, so something like
> /etc/dnsmasq.d/libvirt.conf, and then have another one for lxc
> (/etc/dnsmasq.d/lxc.conf). The main dnsmasq.conf file should be empty.
> But again I need to dig around a bit to remind myself of how things
> work.
>
> Did you do any testing other than lxc-net starting? did you validate
> the dnsmasq functions on the lxcbr0 that is bound to the new instance
> of dnsmasq?
I did not do any other test about lxc-net except starting.
if we don't remove 'bind-interfaces' , the lxcbr0 would also be created 
correctly . But the dnsmasq will fail. I have no idea if it has an 
influence on  IP address assignment of lxc.

I will validate it later.

thanks,
haitao
>
> MarkA
>
>> So we just remove 'bind-interfaces' in lxc service scripts.
>>
>> Signed-off-by: Liu Haitao <haitao.liu@windriver.com>
>> ---
>>   ...1-lxc-Disable-the-bind-interfaces-for-lxc.patch | 45 ++++++++++++++++++++++
>>   recipes-containers/lxc/lxc_2.0.8.bb                |  1 +
>>   2 files changed, 46 insertions(+)
>>   create mode 100644 recipes-containers/lxc/files/0001-lxc-Disable-the-bind-interfaces-for-lxc.patch
>>
>> diff --git a/recipes-containers/lxc/files/0001-lxc-Disable-the-bind-interfaces-for-lxc.patch b/recipes-containers/lxc/files/0001-lxc-Disable-the-bind-interfaces-for-lxc.patch
>> new file mode 100644
>> index 0000000..fec6843
>> --- /dev/null
>> +++ b/recipes-containers/lxc/files/0001-lxc-Disable-the-bind-interfaces-for-lxc.patch
>> @@ -0,0 +1,45 @@
>> +From 76533652915dcca2ce4265b320fd1c20a75adff8 Mon Sep 17 00:00:00 2001
>> +From: Liu Haitao <haitao.liu@windriver.com>
>> +Date: Sun, 17 Dec 2017 23:02:13 -0800
>> +Subject: [PATCH] lxc: Disable the bind-interfaces for lxc.
>> +
>> +When enable lxc service it failed with the following errors:
>> +"""
>> +    dnsmasq: cannot set --bind-interfaces and --bind-dynamic
>> +    Failed to setup lxc-net.
>> +"""
>> +It said that the "bind-interfaces" and "bind-dynamic" cannot
>> +cooperate together.
>> +These two options have the same fundamental capacity of binding
>> +network interfaces.
>> +So dnsmasq just require one of this kind of option.
>> +For some reason ,the following commit  compulsively add the "bind-dynamic" option
>> +for dnsamsq.
>> +"""
>> +       c3c4d977cbb51363f9030c2e39d56a772b29f73b
>> +"""
>> +So we just remove 'bind-interfaces' in lxc service scripts.
>> +
>> +Upstream-Status: Inappropiate [Modify configuration]
>> +
>> +Signed-off-by: Liu Haitao <haitao.liu@windriver.com>
>> +---
>> + config/init/common/lxc-net.in | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/config/init/common/lxc-net.in b/config/init/common/lxc-net.in
>> +index f770950f..6f45228d 100644
>> +--- a/config/init/common/lxc-net.in
>> ++++ b/config/init/common/lxc-net.in
>> +@@ -128,7 +128,7 @@ start() {
>> +     done
>> +
>> +     dnsmasq $LXC_DHCP_CONFILE_ARG $LXC_DOMAIN_ARG -u ${DNSMASQ_USER} \
>> +-            --strict-order --bind-interfaces --pid-file="${varrun}"/dnsmasq.pid \
>> ++            --strict-order --pid-file="${varrun}"/dnsmasq.pid \
>> +             --listen-address ${LXC_ADDR} --dhcp-range ${LXC_DHCP_RANGE} \
>> +             --dhcp-lease-max=${LXC_DHCP_MAX} --dhcp-no-override \
>> +             --except-interface=lo --interface=${LXC_BRIDGE} \
>> +--
>> +2.11.0
>> +
>> diff --git a/recipes-containers/lxc/lxc_2.0.8.bb b/recipes-containers/lxc/lxc_2.0.8.bb
>> index c9ce5f0..5267bf7 100644
>> --- a/recipes-containers/lxc/lxc_2.0.8.bb
>> +++ b/recipes-containers/lxc/lxc_2.0.8.bb
>> @@ -36,6 +36,7 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
>>          file://lxc-doc-upgrade-to-use-docbook-3.1-DTD.patch \
>>          file://logs-optionally-use-base-filenames-to-report-src-fil.patch \
>>          file://cgroups-work-around-issue-in-gcc-7.patch \
>> +       file://0001-lxc-Disable-the-bind-interfaces-for-lxc.patch \
>>          "
>>
>>   SRC_URI[md5sum] = "7bfd95280522d7936c0979dfea92cdb5"
>> --
>> 2.11.0
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization


--------------8D931598BC6FAC3644CC32F0
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 2017年12月19日 11:14, Mark Asselstine
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAPuovEKHtgbGtKDiogu6u1wp1Ct5h=36G_T6rrSpC1LzfXvkbw@mail.gmail.com">
      <pre wrap="">On Mon, Dec 18, 2017 at 8:58 PM, Liu Haitao <a class="moz-txt-link-rfc2396E" href="mailto:haitao.liu@windriver.com">&lt;haitao.liu@windriver.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">When enable lxc service it failed with the following errors:

"""
root@intel-x86-64:~# /usr/libexec/lxc/lxc-net start

     dnsmasq: cannot set --bind-interfaces and --bind-dynamic
     Failed to setup lxc-net.
"""

It said that the "bind-interfaces" and "bind-dynamic" cannot cooperate together.
These two options have the same fundamental capacity of binding network interfaces.

So dnsmasq just require one of this kind of option.

For some reason ,the following commit  compulsively add the "bind-dynamic" option
for dnsamsq.

"""
        c3c4d977cbb51363f9030c2e39d56a772b29f73b
"""
</pre>
      </blockquote>
      <pre wrap="">
It is not for "some reason", it is for a specific reason that is
explained in detail in the commit log and in the comment that goes
with the setting. Libvirt will have issues setting up virbr0 if we do
not use 'bind-dynamic'.

Now you aren't touching the dnsmasq.conf file which is good since you
will not be breaking libvirt with this change but I will have to take
a closer look at your approach to see if it valid for lxc-net. Really
we should move the 'bind-dynamic' into a libvirt specific
sub-configuration file in /etc/dnsmasq.d/, so something like
/etc/dnsmasq.d/libvirt.conf, and then have another one for lxc
(/etc/dnsmasq.d/lxc.conf). The main dnsmasq.conf file should be empty.
But again I need to dig around a bit to remind myself of how things
work.

Did you do any testing other than lxc-net starting? did you validate
the dnsmasq functions on the lxcbr0 that is bound to the new instance
of dnsmasq?</pre>
    </blockquote>
    I did not do any other test about lxc-net except starting.<br>
    if we don't remove 'bind-interfaces' , the lxcbr0 would also be
    created correctly . But the dnsmasq will fail. I have no idea if it
    has an influence on  IP address assignment of lxc. <br>
    <br>
    I will validate it later.<span id="tran_0_5" class="" style="color:
      rgb(67, 67, 67); font-family: Arial, sans-serif; font-size: 14px;
      font-style: normal; font-variant-ligatures: normal;
      font-variant-caps: normal; font-weight: 400; letter-spacing:
      normal; orphans: 2; text-align: left; text-indent: 0px;
      text-transform: none; white-space: normal; widows: 2;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(252, 252, 254); text-decoration-style:
      initial; text-decoration-color: initial;"></span> <br>
    <br>
    thanks,<br>
    haitao<br>
    <blockquote type="cite"
cite="mid:CAPuovEKHtgbGtKDiogu6u1wp1Ct5h=36G_T6rrSpC1LzfXvkbw@mail.gmail.com">
      <pre wrap="">

MarkA

</pre>
      <blockquote type="cite">
        <pre wrap="">
So we just remove 'bind-interfaces' in lxc service scripts.

Signed-off-by: Liu Haitao <a class="moz-txt-link-rfc2396E" href="mailto:haitao.liu@windriver.com">&lt;haitao.liu@windriver.com&gt;</a>
---
 ...1-lxc-Disable-the-bind-interfaces-for-lxc.patch | 45 ++++++++++++++++++++++
 recipes-containers/lxc/lxc_2.0.8.bb                |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 recipes-containers/lxc/files/0001-lxc-Disable-the-bind-interfaces-for-lxc.patch

diff --git a/recipes-containers/lxc/files/0001-lxc-Disable-the-bind-interfaces-for-lxc.patch b/recipes-containers/lxc/files/0001-lxc-Disable-the-bind-interfaces-for-lxc.patch
new file mode 100644
index 0000000..fec6843
--- /dev/null
+++ b/recipes-containers/lxc/files/0001-lxc-Disable-the-bind-interfaces-for-lxc.patch
@@ -0,0 +1,45 @@
+From 76533652915dcca2ce4265b320fd1c20a75adff8 Mon Sep 17 00:00:00 2001
+From: Liu Haitao <a class="moz-txt-link-rfc2396E" href="mailto:haitao.liu@windriver.com">&lt;haitao.liu@windriver.com&gt;</a>
+Date: Sun, 17 Dec 2017 23:02:13 -0800
+Subject: [PATCH] lxc: Disable the bind-interfaces for lxc.
+
+When enable lxc service it failed with the following errors:
+"""
+    dnsmasq: cannot set --bind-interfaces and --bind-dynamic
+    Failed to setup lxc-net.
+"""
+It said that the "bind-interfaces" and "bind-dynamic" cannot
+cooperate together.
+These two options have the same fundamental capacity of binding
+network interfaces.
+So dnsmasq just require one of this kind of option.
+For some reason ,the following commit  compulsively add the "bind-dynamic" option
+for dnsamsq.
+"""
+       c3c4d977cbb51363f9030c2e39d56a772b29f73b
+"""
+So we just remove 'bind-interfaces' in lxc service scripts.
+
+Upstream-Status: Inappropiate [Modify configuration]
+
+Signed-off-by: Liu Haitao <a class="moz-txt-link-rfc2396E" href="mailto:haitao.liu@windriver.com">&lt;haitao.liu@windriver.com&gt;</a>
+---
+ config/init/common/lxc-net.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/config/init/common/lxc-net.in b/config/init/common/lxc-net.in
+index f770950f..6f45228d 100644
+--- a/config/init/common/lxc-net.in
++++ b/config/init/common/lxc-net.in
+@@ -128,7 +128,7 @@ start() {
+     done
+
+     dnsmasq $LXC_DHCP_CONFILE_ARG $LXC_DOMAIN_ARG -u ${DNSMASQ_USER} \
+-            --strict-order --bind-interfaces --pid-file="${varrun}"/dnsmasq.pid \
++            --strict-order --pid-file="${varrun}"/dnsmasq.pid \
+             --listen-address ${LXC_ADDR} --dhcp-range ${LXC_DHCP_RANGE} \
+             --dhcp-lease-max=${LXC_DHCP_MAX} --dhcp-no-override \
+             --except-interface=lo --interface=${LXC_BRIDGE} \
+--
+2.11.0
+
diff --git a/recipes-containers/lxc/lxc_2.0.8.bb b/recipes-containers/lxc/lxc_2.0.8.bb
index c9ce5f0..5267bf7 100644
--- a/recipes-containers/lxc/lxc_2.0.8.bb
+++ b/recipes-containers/lxc/lxc_2.0.8.bb
@@ -36,6 +36,7 @@ SRC_URI = <a class="moz-txt-link-rfc2396E" href="http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz\file://lxc-doc-upgrade-to-use-docbook-3.1-DTD.patch\file://logs-optionally-use-base-filenames-to-report-src-fil.patch\file://cgroups-work-around-issue-in-gcc-7.patch\+file://0001-lxc-Disable-the-bind-interfaces-for-lxc.patch\">"http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
        file://lxc-doc-upgrade-to-use-docbook-3.1-DTD.patch \
        file://logs-optionally-use-base-filenames-to-report-src-fil.patch \
        file://cgroups-work-around-issue-in-gcc-7.patch \
+       file://0001-lxc-Disable-the-bind-interfaces-for-lxc.patch \
        "</a>

 SRC_URI[md5sum] = "7bfd95280522d7936c0979dfea92cdb5"
--
2.11.0

--
_______________________________________________
meta-virtualization mailing list
<a class="moz-txt-link-abbreviated" href="mailto:meta-virtualization@yoctoproject.org">meta-virtualization@yoctoproject.org</a>
<a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/listinfo/meta-virtualization">https://lists.yoctoproject.org/listinfo/meta-virtualization</a>
</pre>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------8D931598BC6FAC3644CC32F0--
