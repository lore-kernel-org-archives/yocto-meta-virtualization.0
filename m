Return-Path: <mbgrego@tycho.nsa.gov>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B9D8CE00AF2; Tue, 22 Dec 2015 05:01:45 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [63.239.67.10 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from emvm-gh1-uea09.nsa.gov (emvm-gh1-uea09.nsa.gov [63.239.67.10])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 37D59E00457
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Dec 2015 05:01:41 -0800 (PST)
X-TM-IMSS-Message-ID: <0d560a8100006eb3@nsa.gov>
Received: from tarius.tycho.ncsc.mil ([144.51.242.1]) by nsa.gov
	([10.208.42.194]) with ESMTP (TREND IMSS SMTP Service 7.1) id
	0d560a8100006eb3 ; Tue, 22 Dec 2015 08:04:16 -0500
Received: from moss-wolfpack.infosec.tycho.ncsc.mil (moss-wolfpack
	[192.168.25.76])
	by tarius.tycho.ncsc.mil (8.14.4/8.14.4) with ESMTP id tBMD1dtC014245; 
	Tue, 22 Dec 2015 08:01:40 -0500
To: Doug Goldstein <cardoe@cardoe.com>, meta-virtualization@yoctoproject.org
References: <1450285722-14530-1-git-send-email-mbgrego@tycho.nsa.gov>
	<1450285722-14530-2-git-send-email-mbgrego@tycho.nsa.gov>
	<5678E38F.3030609@cardoe.com>
From: "M. Gregory" <mbgrego@tycho.nsa.gov>
X-Enigmail-Draft-Status: N1110
Message-ID: <56794133.5010805@tycho.nsa.gov>
Date: Tue, 22 Dec 2015 07:25:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <5678E38F.3030609@cardoe.com>
X-TM-AS-MML: disable
Subject: Re: [V2 Patch 2/2] Enables XSM functionality in builds that contain "xsm" in the PACKAGECONFIG.
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
X-List-Received-Date: Tue, 22 Dec 2015 13:01:45 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

I believe this patch will still be needed. Your patch to Xen just
enables the flask utilities to be built. The XSM framework and policy
loading code will still need to be compiled.

-Machon

On 12/22/2015 12:45 AM, Doug Goldstein wrote:
> On 12/16/15 11:08 AM, Machon Gregory wrote:
>> * Correctly identifies xenpolicy by ${PV}
>> * Adds a check to identify if xsm is specified in PACKAGECONFIG and if so manually sets XSM_ENABLE in Xen's .config
>>
>> Signed-off-by: Machon Gregory <mbgrego@tycho.nsa.gov>
>> ---
>>  recipes-extended/xen/xen.inc | 16 +++++++++++++++-
>>  1 file changed, 15 insertions(+), 1 deletion(-)
>>
>> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
>> index 9e35459..03ec935 100644
>> --- a/recipes-extended/xen/xen.inc
>> +++ b/recipes-extended/xen/xen.inc
>> @@ -333,7 +333,7 @@ FILES_${PN}-flask = "\
>>      ${sbindir}/flask-loadpolicy \
>>      ${sbindir}/flask-set-bool \
>>      ${sbindir}/flask-setenforce \
>> -    /boot/xenpolicy.24 \
>> +    /boot/xenpolicy-${PV} \
>>      "
>>  
>>  FILES_${PN}-gdbsx = "\
>> @@ -715,6 +715,15 @@ EXTRA_OECONF += " \
>>      --disable-ocamltools \
>>      "
>>  
>> +# check for XSM in package config to allow XSM_ENABLE to be set 
>> +python () {
>> +    pkgconfig = d.getVar('PACKAGECONFIG', True)
>> +    if ('xsm') in pkgconfig.split():
>> +        d.setVar('XSM_ENABLED', '1')
>> +    else:
>> +        d.setVar('XSM_ENABLED', '0')
>> +}
>> +
>>  do_configure() {
>>      # no stubs-32.h in our 64-bit sysroot - hack it into tools/include/gnu
>>      if ! test -f ${STAGING_DIR_TARGET}/usr/include/gnu/stubs-32.h ; then
>> @@ -727,6 +736,11 @@ do_configure() {
>>          fi
>>      fi
>>  
>> +    #./configure --enable-xsm does not set XSM_ENABLE must be done manually
>> +    if [ "${XSM_ENABLED}" = "1" ]; then
>> +        echo "XSM_ENABLE := y" > ${S}/.config
>> +    fi
>> +
>>      # do configure
>>      oe_runconf
>>  }
>>
> This should do the trick for Xen 4.5 and Xen 4.6, however for 4.7 I've
> just submitted some changes to how FLASK and XSM are built and this will
> break there but we'll cross that bridge then.
>
> Reviewed-by: Doug Goldstein <cardoe@cardoe.com>
>

