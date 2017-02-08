Return-Path: <amarnath.valluri@intel.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 33C71E0093F; Wed,  8 Feb 2017 06:36:44 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [134.134.136.100 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D8F97E0092C
	for <meta-virtualization@yoctoproject.org>;
	Wed,  8 Feb 2017 06:36:42 -0800 (PST)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga105.jf.intel.com with ESMTP; 08 Feb 2017 06:36:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,346,1477983600"; d="scan'208,217";a="41503858"
Received: from irdmzpr05.ir.intel.com (HELO [163.33.54.155]) ([163.33.54.155])
	by orsmga002.jf.intel.com with ESMTP; 08 Feb 2017 06:36:41 -0800
To: mark.asselstine@windriver.com
References: <1486561594-24053-1-git-send-email-amarnath.valluri@intel.com>
	<1486561594-24053-4-git-send-email-amarnath.valluri@intel.com>
	<CAPuovEJs8vWHca-GW5aMj29PXXyPn3qPAmNpZ7ESRJYxqznmbA@mail.gmail.com>
From: avalluri <amarnath.valluri@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <48deae3a-974f-406e-4091-7476397847aa@intel.com>
Date: Wed, 8 Feb 2017 16:37:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CAPuovEJs8vWHca-GW5aMj29PXXyPn3qPAmNpZ7ESRJYxqznmbA@mail.gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 4/4] libvirt: Replace systemd units location to match with bitbake environment.
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
X-List-Received-Date: Wed, 08 Feb 2017 14:36:44 -0000
Content-Type: multipart/alternative;
	boundary="------------747029355516821B98562E1D"

--------------747029355516821B98562E1D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 08.02.2017 16:15, Mark Asselstine wrote:
> On Wed, Feb 8, 2017 at 8:46 AM, Amarnath Valluri
> <amarnath.valluri@intel.com>  wrote:
>> Signed-off-by: Amarnath Valluri<amarnath.valluri@intel.com>
>> ---
>>   recipes-extended/libvirt/libvirt_1.3.5.bb | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/recipes-extended/libvirt/libvirt_1.3.5.bb b/recipes-extended/libvirt/libvirt_1.3.5.bb
>> index c848c99..206f59f 100644
>> --- a/recipes-extended/libvirt/libvirt_1.3.5.bb
>> +++ b/recipes-extended/libvirt/libvirt_1.3.5.bb
>> @@ -213,6 +213,12 @@ PACKAGECONFIG[wireshark] = "--with-wireshark-dissector,--without-wireshark-disse
>>   # Enable the Python tool support
>>   require libvirt-python.inc
>>
>> +do_configure_prepend() {
>> +       systemd_system_unitdir="${@d.getVar('systemd_system_unitdir')}"
>> +       sed -i -e "s;^SYSTEMD_UNIT_DIR =.*;SYSTEMD_UNIT_DIR = $systemd_system_unitdir;" \
>> +            ${S}/daemon/Makefile.am ${S}/src/Makefile.am ${S}/tools/Makefile.am
> The others patches look fine but for this one is there no way to pass
> the value to make? I almost prefer to have this taken care of via a
> patch to the source instead of sed expressions here.
Its value is hard coded in Makefile.am, one thing we can do is to patch 
the configure.ac to make systemd unit dir configurable from outside. I 
can send the V2 with this change.

-Amarnath

--------------747029355516821B98562E1D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 08.02.2017 16:15, Mark Asselstine
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAPuovEJs8vWHca-GW5aMj29PXXyPn3qPAmNpZ7ESRJYxqznmbA@mail.gmail.com"
      type="cite">
      <pre wrap="">On Wed, Feb 8, 2017 at 8:46 AM, Amarnath Valluri
<a moz-do-not-send="true" class="moz-txt-link-rfc2396E" href="mailto:amarnath.valluri@intel.com">&lt;amarnath.valluri@intel.com&gt;</a> wrote:
</pre>
      <blockquote type="cite" style="color: #000000;">
        <pre wrap="">Signed-off-by: Amarnath Valluri <a moz-do-not-send="true" class="moz-txt-link-rfc2396E" href="mailto:amarnath.valluri@intel.com">&lt;amarnath.valluri@intel.com&gt;</a>
---
 recipes-extended/libvirt/libvirt_1.3.5.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/recipes-extended/libvirt/libvirt_1.3.5.bb b/recipes-extended/libvirt/libvirt_1.3.5.bb
index c848c99..206f59f 100644
--- a/recipes-extended/libvirt/libvirt_1.3.5.bb
+++ b/recipes-extended/libvirt/libvirt_1.3.5.bb
@@ -213,6 +213,12 @@ PACKAGECONFIG[wireshark] = "--with-wireshark-dissector,--without-wireshark-disse
 # Enable the Python tool support
 require libvirt-python.inc

+do_configure_prepend() {
+       systemd_system_unitdir=<a moz-do-not-send="true" class="moz-txt-link-rfc2396E" href="mailto:$%7B@d.getVar%28%27systemd_system_unitdir%27%29%7D">"${@d.getVar('systemd_system_unitdir')}"</a>
+       sed -i -e "s;^SYSTEMD_UNIT_DIR =.*;SYSTEMD_UNIT_DIR = $systemd_system_unitdir;" \
+            ${S}/daemon/Makefile.am ${S}/src/Makefile.am ${S}/tools/Makefile.am
</pre>
      </blockquote>
      <pre wrap="">The others patches look fine but for this one is there no way to pass
the value to make? I almost prefer to have this taken care of via a
patch to the source instead of sed expressions here.</pre>
    </blockquote>
    Its value is hard coded in Makefile.am, one thing we can do is to
    patch the configure.ac to make systemd unit dir configurable from
    outside. I can send the V2 with this change.<br>
    <br>
    -Amarnath<br>
  </body>
</html>

--------------747029355516821B98562E1D--
