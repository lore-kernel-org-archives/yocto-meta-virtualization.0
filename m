Return-Path: <Dengke.Du@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7DBFDE00D04; Thu,  7 Mar 2019 18:44:30 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9B618E00CEE
	for <meta-virtualization@yoctoproject.org>;
	Thu,  7 Mar 2019 18:44:28 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x282iR8g003514
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 7 Mar 2019 18:44:28 -0800 (PST)
Received: from [128.224.162.184] (128.224.162.184) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Thu, 7 Mar 2019 18:44:27 -0800
To: Mark Hatle <mark.hatle@windriver.com>,
	<meta-virtualization@yoctoproject.org>
References: <1551927535-18666-1-git-send-email-dengke.du@windriver.com>
	<c7e7d530-742d-744e-bbff-615347e1f5d4@windriver.com>
From: ddu <dengke.du@windriver.com>
Message-ID: <2e9b71b6-1a22-bc54-9acc-6499351359f2@windriver.com>
Date: Fri, 8 Mar 2019 10:44:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <c7e7d530-742d-744e-bbff-615347e1f5d4@windriver.com>
X-Originating-IP: [128.224.162.184]
Subject: Re: [m-c-s][PATCH] libvirt: fix GROUPADD_PARAM override conflict
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
X-List-Received-Date: Fri, 08 Mar 2019 02:44:30 -0000
Content-Type: multipart/alternative;
	boundary="------------20E0729C44C2F3D0397007A1"
Content-Language: en-US

--------------20E0729C44C2F3D0397007A1
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit


在 2019/3/7 下午10:00, Mark Hatle 写道:
> On 3/6/19 8:58 PM, Dengke Du wrote:
>> The libvirt recipe in meta-virtualization already define the GROUPADD_PARAM,
>> so we should append it, not override.
>>
>> Signed-off-by: Dengke Du <dengke.du@windriver.com>
>> ---
>>   meta-openstack/recipes-extended/libvirt/libvirt_4.%.bbappend | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-openstack/recipes-extended/libvirt/libvirt_4.%.bbappend b/meta-openstack/recipes-extended/libvirt/libvirt_4.%.bbappend
>> index b55f9a9..0b0f011 100644
>> --- a/meta-openstack/recipes-extended/libvirt/libvirt_4.%.bbappend
>> +++ b/meta-openstack/recipes-extended/libvirt/libvirt_4.%.bbappend
>> @@ -5,7 +5,7 @@ PACKAGECONFIG ?= "qemu lxc test remote macvtap libvirtd udev yajl \
>>   
>>   inherit useradd
>>   USERADD_PACKAGES = "${PN}"
>> -GROUPADD_PARAM_${PN} = "--system libvirt"
>> +GROUPADD_PARAM_${PN}_append = " ;--system libvirt"
> The __append should be fine then, but why the ';'?  That part looks wrong, since
> typically the PARAM is the parameters passed directly to the groupadd program.
> I don't believe ';' is a valid parameter.

First, adding ';' or not adding ';' are the same for building libvirt, 
the group: qemu, kvm, libvirt are all created successfully.

Second, adding ';' just according to some processing rule from the link:

https://git.openembedded.org/openembedded-core/tree/meta/classes/useradd.bbclass#n54

-----------------------------------------------------------------------------------------------------------------------

if test "x`echo $GROUPADD_PARAM | tr -d '[:space:]'`" != "x"; then
	echo "Running groupadd commands..."
	# Invoke multiple instances of groupadd for parameter lists
	# separated by ';'
	opts=`echo "$GROUPADD_PARAM" | cut -d ';' -f 1 | sed -e 's#[ \t]*$##'`
	remaining=`echo "$GROUPADD_PARAM" | cut -d ';' -f 2- | sed -e 's#[ \t]*$##'`
	while test "x$opts" != "x"; do
		perform_groupadd "$SYSROOT" "$OPT $opts"
		if test "x$opts" = "x$remaining"; then
			break
		fi
		opts=`echo "$remaining" | cut -d ';' -f 1 | sed -e 's#[ \t]*$##'`
		remaining=`echo "$remaining" | cut -d ';' -f 2- | sed -e 's#[ \t]*$##'`
	done
fi

-----------------------------------------------------------------------------------------------------------------------

Maybe in order to let the codes see more orderly.

>
> --Mark
>
>>   do_install_append() {
>>   	sed -e "s:^#unix_sock_group =:unix_sock_group =:g" -i ${D}/etc/libvirt/libvirtd.conf
>>
>

--------------20E0729C44C2F3D0397007A1
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">在 2019/3/7 下午10:00, Mark Hatle 写道:<br>
    </div>
    <blockquote type="cite"
      cite="mid:c7e7d530-742d-744e-bbff-615347e1f5d4@windriver.com">
      <pre class="moz-quote-pre" wrap="">On 3/6/19 8:58 PM, Dengke Du wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">The libvirt recipe in meta-virtualization already define the GROUPADD_PARAM,
so we should append it, not override.

Signed-off-by: Dengke Du <a class="moz-txt-link-rfc2396E" href="mailto:dengke.du@windriver.com">&lt;dengke.du@windriver.com&gt;</a>
---
 meta-openstack/recipes-extended/libvirt/libvirt_4.%.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-extended/libvirt/libvirt_4.%.bbappend b/meta-openstack/recipes-extended/libvirt/libvirt_4.%.bbappend
index b55f9a9..0b0f011 100644
--- a/meta-openstack/recipes-extended/libvirt/libvirt_4.%.bbappend
+++ b/meta-openstack/recipes-extended/libvirt/libvirt_4.%.bbappend
@@ -5,7 +5,7 @@ PACKAGECONFIG ?= "qemu lxc test remote macvtap libvirtd udev yajl \
 
 inherit useradd
 USERADD_PACKAGES = "${PN}"
-GROUPADD_PARAM_${PN} = "--system libvirt"
+GROUPADD_PARAM_${PN}_append = " ;--system libvirt"
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
The __append should be fine then, but why the ';'?  That part looks wrong, since
typically the PARAM is the parameters passed directly to the groupadd program.
I don't believe ';' is a valid parameter.</pre>
    </blockquote>
    <p>First, adding ';' or not adding ';' are the same for building
      libvirt, the group: qemu, kvm, libvirt are all created
      successfully.</p>
    <p>Second, adding ';' just according to some processing rule from
      the link:</p>
    <p>   
<a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core/tree/meta/classes/useradd.bbclass#n54">https://git.openembedded.org/openembedded-core/tree/meta/classes/useradd.bbclass#n54</a></p>
    <p>-----------------------------------------------------------------------------------------------------------------------</p>
    <pre style="padding: 0px; margin: 0px; color: rgb(0, 0, 0); font-size: 13.3333px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;">if test "x`echo $GROUPADD_PARAM | tr -d '[:space:]'`" != "x"; then
	echo "Running groupadd commands..."
	# Invoke multiple instances of groupadd for parameter lists
	# separated by ';'
	opts=`echo "$GROUPADD_PARAM" | cut -d ';' -f 1 | sed -e 's#[ \t]*$##'`
	remaining=`echo "$GROUPADD_PARAM" | cut -d ';' -f 2- | sed -e 's#[ \t]*$##'`
	while test "x$opts" != "x"; do
		perform_groupadd "$SYSROOT" "$OPT $opts"
		if test "x$opts" = "x$remaining"; then
			break
		fi
		opts=`echo "$remaining" | cut -d ';' -f 1 | sed -e 's#[ \t]*$##'`
		remaining=`echo "$remaining" | cut -d ';' -f 2- | sed -e 's#[ \t]*$##'`
	done
fi </pre>
    <p>-----------------------------------------------------------------------------------------------------------------------</p>
    <p>Maybe in order to let the codes see more orderly.<br>
    </p>
    <blockquote type="cite"
      cite="mid:c7e7d530-742d-744e-bbff-615347e1f5d4@windriver.com">
      <pre class="moz-quote-pre" wrap="">

--Mark

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> do_install_append() {
 	sed -e "s:^#unix_sock_group =:unix_sock_group =:g" -i ${D}/etc/libvirt/libvirtd.conf

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">

</pre>
    </blockquote>
  </body>
</html>

--------------20E0729C44C2F3D0397007A1--
