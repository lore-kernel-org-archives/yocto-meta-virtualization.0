Return-Path: <mark.hatle@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 13952E00B43; Thu, 14 Mar 2019 07:18:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F2146E00B43
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Mar 2019 07:18:04 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x2EEI380007347
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Mar 2019 07:18:03 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 14 Mar 2019 07:18:02 -0700
To: Bruce Ashfield <bruce.ashfield@gmail.com>, ddu <dengke.du@windriver.com>
References: <1551927535-18666-1-git-send-email-dengke.du@windriver.com>
	<19ea4f51-91c8-21ff-b972-c7d36ec4e04f@windriver.com>
	<CADkTA4OeoDYtbY3zhgeTUK2LomKcE8-uLy2MBw01SD6Kawj_UA@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Openpgp: preference=signencrypt
Autocrypt: addr=mark.hatle@windriver.com; prefer-encrypt=mutual; keydata=
	mQENBFYKxFgBCACt/pzutBp6p/xVKTFJjHbM3KpQKCblyot/YP+bpTr51Hrc5xDXBQhoG7TC
	aIRvRIvbhEevEQK9y04gW3JK/5lobq5ORebolcsHlYBUvpNeIPjupLQwGvz/TPtrLRNGLqDC
	rvsM6OA2XbQ2bwzxWaSQS3ImE2O2iXOZn9HhThMGeDB4Nff3fgUvXOTDIrgWOn9K2DgLL7Yc
	zkUIlFdj+Nraksd/7BSk8oH6tjeBVhFqSFvKta9QxWgdr58oPaTYaW/xNqUjlLrbJuMw/MSe
	xzuYfdfDfm6J8kRjMOnwQ0n8svJElzqAk+d83ow38gpGQ+LkjGgnf8ZFJ4rUJFADroX3ABEB
	AAG0JU1hcmsgSGF0bGUgPG1hcmsuaGF0bGVAd2luZHJpdmVyLmNvbT6JATcEEwEIACEFAlYK
	xFgCGwMFCwkIBwIGFQgJCgsCBBYCAwECHgECF4AACgkQfv796/r0vvlvZAf9Gs+eN320yhRW
	V/fZCsngKhmOK4v3HrTwFrkSmoD9QHQiE/5IPdNacHwIPwZx07tNBohB8xOeNqCPRYRBwGhA
	AnxKOPyd0nnm6ZhPzbA57v4x3IGRQr4QzvcBTASJq91l3Ew4lpAslyx5w1DPPqRD7G8ycDKg
	peKyDwmdkvCunVisSAQI3XIMq2y230biTO98tDPEezg+lg+yTsz9ZT33F5KNuWrpf8VL5fG/
	mt+kAv7wtsx/KTRbqhH3iFXF6eBSwMjAfTXFlkLfbM9riJGXrWEl9n2S2R3cDHNHug0lb8f4
	whK370KEO4OwRKIYW/VUBmzk5XZUE9DTlDSV8ycsrrkBDQRWCsRYAQgAwK3FuHCE+HW3YWdH
	PUjeSn5p//xJ57u8g2rng8zm9zNjmYgpPv5UxozaD9i2jf4mlQLHGGOezhHae8K4Nj70oVcv
	8AmwcrJa9i9WL1oy/9R3fHMWf/Ctt9VXTO0qlCuq6PDzaUfvsXR61aJIjTKNQTOjCLjY1vXm
	VSewUgARysmA8WrjTfwGBihMBxAX0+kIjx8nOlam0WvekMBXZ0AbS56oTLRxYao6DI3GeB/N
	oWPy/5DfuTKaSdM0Pf8al20x9RuNN5/HLMlyDH/k8bIa1xd9aAqW+Feiw5gC107V2E6ULyIy
	q6em2UrsmIRxrvpHqbNgQKqvTehJ+V/i4g/uOwARAQABiQEfBBgBCAAJBQJWCsRYAhsMAAoJ
	EH7+/ev69L755XAH/3ZcNhooqd9OBhFkvXm1iWZ8EoC7motWqVn2oEyxoonsg8AD9kFXiN+T
	dYp7dH99EZu9q4ptj56AXm4uHzOgywL/5/V2TY6twCGAjUGzDjAB5gzoi+JLIBlDiyOip0eL
	QswIhRk473xy3j8DA4oVamnSPWgyNJ+qsdt37YWDzoDFFvtDoRU7Eb+znfIMDKzlny0XU/8L
	cW1bNHJlpv/78GPdfP4tjysEd8MuA5jf5o5w4XqcwTqalffEJtQ/s3pbkstEi7qm5uPui5Kt
	gq6YYLSqcSNe0GWAF9/T+qwyo7burSTxUWCWtMmlXdAQLW9SynLhB3Jbch0nFAh0fCKi6yY=
Organization: Wind River Systems
Message-ID: <3cbe9ecd-e62f-8b60-8f96-1f390b32fa0f@windriver.com>
Date: Thu, 14 Mar 2019 09:18:02 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.5.3
MIME-Version: 1.0
In-Reply-To: <CADkTA4OeoDYtbY3zhgeTUK2LomKcE8-uLy2MBw01SD6Kawj_UA@mail.gmail.com>
Cc: meta-virtualization@yoctoproject.org
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
X-List-Received-Date: Thu, 14 Mar 2019 14:18:06 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 3/13/19 9:59 PM, Bruce Ashfield wrote:
> I'm waiting for Mark to reply to your explanation. He had the open
> question, I'm waiting for him to ack it.

Sorry, I had nothing to add.. I was satisfied with the answer.

Ack.

--Mark

> Bruce
> 
> On Wed, Mar 13, 2019 at 8:12 PM ddu <dengke.du@windriver.com> wrote:
>>
>> Ping.
>>
>> 在 2019/3/7 上午10:58, Dengke Du 写道:
>>> The libvirt recipe in meta-virtualization already define the GROUPADD_PARAM,
>>> so we should append it, not override.
>>>
>>> Signed-off-by: Dengke Du <dengke.du@windriver.com>
>>> ---
>>>   meta-openstack/recipes-extended/libvirt/libvirt_4.%.bbappend | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta-openstack/recipes-extended/libvirt/libvirt_4.%.bbappend b/meta-openstack/recipes-extended/libvirt/libvirt_4.%.bbappend
>>> index b55f9a9..0b0f011 100644
>>> --- a/meta-openstack/recipes-extended/libvirt/libvirt_4.%.bbappend
>>> +++ b/meta-openstack/recipes-extended/libvirt/libvirt_4.%.bbappend
>>> @@ -5,7 +5,7 @@ PACKAGECONFIG ?= "qemu lxc test remote macvtap libvirtd udev yajl \
>>>
>>>   inherit useradd
>>>   USERADD_PACKAGES = "${PN}"
>>> -GROUPADD_PARAM_${PN} = "--system libvirt"
>>> +GROUPADD_PARAM_${PN}_append = " ;--system libvirt"
>>>
>>>   do_install_append() {
>>>       sed -e "s:^#unix_sock_group =:unix_sock_group =:g" -i ${D}/etc/libvirt/libvirtd.conf
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
> 
> 
> 


