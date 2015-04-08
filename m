Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3BEB0E007A0; Wed,  8 Apr 2015 10:24:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.213.170 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E5C5DE003A8
	for <meta-virtualization@yoctoproject.org>;
	Wed,  8 Apr 2015 10:24:11 -0700 (PDT)
Received: by igblo3 with SMTP id lo3so45794382igb.1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 08 Apr 2015 10:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=8A5nv1zRv8MjJfwXGXgAOsqRuIUc4NDoh9fBPyPH7jA=;
	b=G22y6u7fj3+QMrJ1mDGB/Bpmpbr4xyKX1tOMKb62flDcaJX/lOctRIQP2Li0yQSdSN
	IsFtNvGMgROXIk9AY83brrNHvYOiw054KP2tQQJJPAf9U1hP67A2Dn/JoW8APLelXWrS
	m9KLfnhOIWPs3K0YGR9UfkhperrKaDRyZBG4mcSQM3LMdjkAl7odxLvmJTuQJZL7NGMj
	Agy3vf6LYqAUIKsI7MQAfy899gvGZvA/AYg4Cmn8YBUxs4lK9cHas628dUBmF6TLrPto
	eU+XEm0gpmdCSkfnTdi/sX60YZera3pKQFGznly9ROy2iNQSL1/YwmxywdXYthuTn6mQ
	iwVQ==
MIME-Version: 1.0
X-Received: by 10.50.30.202 with SMTP id u10mr13651333igh.28.1428513850783;
	Wed, 08 Apr 2015 10:24:10 -0700 (PDT)
Received: by 10.107.158.20 with HTTP; Wed, 8 Apr 2015 10:24:10 -0700 (PDT)
In-Reply-To: <CADGJdkmNL4mG_XeRaaXaWvrLQ10KFo6LkjHHZgAhXa1c98Rj=A@mail.gmail.com>
References: <CADGJdkmNL4mG_XeRaaXaWvrLQ10KFo6LkjHHZgAhXa1c98Rj=A@mail.gmail.com>
Date: Wed, 8 Apr 2015 13:24:10 -0400
Message-ID: <CADkTA4ObJoGRoe7ss6pEL4JRNFoJBVf3B9PCmxb8VaBOHnZOMg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Michael Matera <matera@lifealgorithmic.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Error building libvirt with pcap development files installed.
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
X-List-Received-Date: Wed, 08 Apr 2015 17:24:14 -0000
X-Groupsio-MsgNum: 964
Content-Type: multipart/mixed; boundary=047d7b874b2ca2910f051339cc28

--047d7b874b2ca2910f051339cc28
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 8, 2015 at 1:14 AM, Michael Matera
<matera@lifealgorithmic.com> wrote:
> Hello folks!
>
> This is my first post so I'll try to make it a good one. I ran into some

:). welcome!

> trouble building kvm-image-minimal on Ubuntu 14.04 I suspect because I have
> the libpcap0.80-dev package installed on my build host. Here's some details:
>
> BB_VERSION        = "1.24.0"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "Ubuntu-14.04"
> TARGET_SYS        = "x86_64-poky-linux"
> MACHINE           = "genericx86-64"
> DISTRO            = "poky"
> DISTRO_VERSION    = "1.7.1"
> TUNE_FEATURES     = "m64 core2"
> TARGET_FPU        = ""
> meta
> meta-yocto
> meta-yocto-bsp    = "dizzy:ec75238f6cc2d2d8d40e0268f6d2acc070cbe9a4"
> meta-virtualization = "dizzy:8ec8270017fbeae8fcb8c2d82a60a9f5116b0cf2"
> meta-python
> meta-oe
> meta-networking
> meta-filesystems  = "dizzy:2ebb8752f378c9987b0ece5a14915d703b872c1d"
>
> Looking in the log I see:
>
>   /usr/lib/x86_64-linux-gnu/libdevmapper.so: undefined reference to
> `matchpathcon'
>
> It seems that the compiler already warned me about this:
>
>   warning: library search path "/usr/lib/x86_64-linux-gnu" is unsafe for
> cross-compilation
>
> Going back to log.do_configure, I see:
>
>   configure:     pcap: -I/usr/include -L/usr/lib/x86_64-linux-gnu  -lpcap
>
> This is clearly not right and it shows me that libvirt needs to be
> configured with a specific location for libpcap. My fix, if you can call it
> that, is to pass --without-pcap to configure. I did that by adding the
> following line to libvirt_1.2.8.bb:
>
> PACKAGECONFIG[libpcap] =
> "--with-libpcap=MIKEKNOWSNOT,--without-libpcap,libpcap,"

We have libpcap as a dependency for libvirt, so while the package config
value works to disable the option, what we need is to point libvirt's
configuration
phase to the sysroot, where our target version of libpcap can be found.

That's fundamentally the same thing you are asking above, just without
packageconfig injecting it into the configuration phase.

.. I went and had a look at how libvirt deals with libpcap and that flag
doesn't do what you expect in the --with usage .. it only points to a different
location for pcap-config. pcap-config is stubbed out in our system, so that
will never work.

As it turns out, everyone has had a floating or mis identified libcap (my
config.log doesn't find it, and hence just has 'no').

I pulled together the attached patch, it allows my libpcap from the sysroot
to be found and used for the build.

I didn't do any runtime testing, but if it works for you, I'll push it
to the tree
shortly.

Cheers,

Bruce

>
> I'm new to Yocto so I haven't read the 2,000 page reference manual closely
> enough to properly formulate a better PACKAGECONFIG line. Perhaps you could
> help me with that. :-) In any case, libvirt compiles fine without libpcap
> and kvm-image-minimal is now built. I'm looking forward to testing it.
>
> Cheers
> ./m
>
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

--047d7b874b2ca2910f051339cc28
Content-Type: text/x-patch; charset=US-ASCII; 
	name="0001-libvirt-use-pkg-config-to-locate-libcap.patch"
Content-Disposition: attachment; 
	filename="0001-libvirt-use-pkg-config-to-locate-libcap.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_i8909f4t0

RnJvbSAyOWJjYTc1ZmE2NTY3MTNlM2FiNjRmNmZmOGQyNmE2NzlmMTBhMTNjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBCcnVjZSBBc2hmaWVsZCA8YnJ1Y2UuYXNoZmllbGRAd2luZHJp
dmVyLmNvbT4KRGF0ZTogV2VkLCA4IEFwciAyMDE1IDEzOjEyOjU2IC0wNDAwClN1YmplY3Q6IFtQ
QVRDSF0gbGlidmlydDogdXNlIHBrZy1jb25maWcgdG8gbG9jYXRlIGxpYmNhcAoKbGlidmlydCB3
YW50cyB0byB1c2UgcGNhcC1jb25maWcgdG8gbG9jYXRlIHRoZSBleGlzZW5jZSBhbmQgbG9jYXRp
b24Kb2YgbGlicGNhcC4gb2UtY29yZSBzdHVicyB0aGlzIHNjcmlwdCBhbmQgcmVwbGFjZXMgaXQg
d2l0aCBwa2ctY29uZmlnLAp3aGljaCBjYW4gbGVhZCB0byB0aGUgaG9zdCBwY2FwLWNvbmZpZyB0
cmlnZ2VyaW5nIGFuZCBlaXRoZXIgYnJlYWtpbmcKdGhlIGJ1aWxkIG9yIGludHJvZHVjaW5nIGhv
c3QgY29udGFtaW5hdGlvbi4KClRvIGZpeCB0aGlzIGlzc3VlLCB3ZSBwYXRjaCBjb25maWd1cmUg
dG8gdXNlICdwa2ctY29uZmlnIGxpYmNhcCcgdG8KbG9jYXRlIHRoZSBjb3JyZWN0IGxpYnJhcmll
cy4KClNpZ25lZC1vZmYtYnk6IEJydWNlIEFzaGZpZWxkIDxicnVjZS5hc2hmaWVsZEB3aW5kcml2
ZXIuY29tPgotLS0KIC4uLi9saWJ2aXJ0LXVzZS1wa2ctY29uZmlnLXRvLWxvY2F0ZS1saWJjYXAu
cGF0Y2ggIHwgNDUgKysrKysrKysrKysrKysrKysrKysrKwogcmVjaXBlcy1leHRlbmRlZC9saWJ2
aXJ0L2xpYnZpcnRfMS4yLjEyLmJiICAgICAgICAgfCAgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDQ2
IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCByZWNpcGVzLWV4dGVuZGVkL2xpYnZp
cnQvbGlidmlydC9saWJ2aXJ0LXVzZS1wa2ctY29uZmlnLXRvLWxvY2F0ZS1saWJjYXAucGF0Y2gK
CmRpZmYgLS1naXQgYS9yZWNpcGVzLWV4dGVuZGVkL2xpYnZpcnQvbGlidmlydC9saWJ2aXJ0LXVz
ZS1wa2ctY29uZmlnLXRvLWxvY2F0ZS1saWJjYXAucGF0Y2ggYi9yZWNpcGVzLWV4dGVuZGVkL2xp
YnZpcnQvbGlidmlydC9saWJ2aXJ0LXVzZS1wa2ctY29uZmlnLXRvLWxvY2F0ZS1saWJjYXAucGF0
Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi42NWIwNDZlZWE1ODYK
LS0tIC9kZXYvbnVsbAorKysgYi9yZWNpcGVzLWV4dGVuZGVkL2xpYnZpcnQvbGlidmlydC9saWJ2
aXJ0LXVzZS1wa2ctY29uZmlnLXRvLWxvY2F0ZS1saWJjYXAucGF0Y2gKQEAgLTAsMCArMSw0NSBA
QAorRnJvbSAzZTI3MWY2ZGIxMmZmZTM0ODQzNDI4ZWMyZjBiY2E3YThmZTNhYTY1IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbTogQnJ1Y2UgQXNoZmllbGQgPGJydWNlLmFzaGZpZWxkQHdp
bmRyaXZlci5jb20+CitEYXRlOiBXZWQsIDggQXByIDIwMTUgMTM6MDM6MDMgLTA0MDAKK1N1Ympl
Y3Q6IFtQQVRDSF0gbGlidmlydDogdXNlIHBrZy1jb25maWcgdG8gbG9jYXRlIGxpYmNhcAorCits
aWJ2aXJ0IHdhbnRzIHRvIHVzZSBwY2FwLWNvbmZpZyB0byBsb2NhdGUgdGhlIGV4aXNlbmNlIGFu
ZCBsb2NhdGlvbgorb2YgbGlicGNhcC4gb2UtY29yZSBzdHVicyB0aGlzIHNjcmlwdCBhbmQgcmVw
bGFjZXMgaXQgd2l0aCBwa2ctY29uZmlnLAord2hpY2ggY2FuIGxlYWQgdG8gdGhlIGhvc3QgcGNh
cC1jb25maWcgdHJpZ2dlcmluZyBhbmQgZWl0aGVyIGJyZWFraW5nCit0aGUgYnVpbGQgb3IgaW50
cm9kdWNpbmcgaG9zdCBjb250YW1pbmF0aW9uLgorCitUbyBmaXggdGhpcyBpc3N1ZSwgd2UgcGF0
Y2ggY29uZmlndXJlIHRvIHVzZSAncGtnLWNvbmZpZyBsaWJjYXAnIHRvCitsb2NhdGUgdGhlIGNv
cnJlY3QgbGlicmFyaWVzLgorCitTaWduZWQtb2ZmLWJ5OiBCcnVjZSBBc2hmaWVsZCA8YnJ1Y2Uu
YXNoZmllbGRAd2luZHJpdmVyLmNvbT4KKy0tLQorIGNvbmZpZ3VyZS5hYyB8IDYgKysrLS0tCisg
MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKKworZGlmZiAt
LWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYworaW5kZXggZjM3MDQ3NTk5Yjc2Li41
ZjliODQzNjNiOTYgMTAwNjQ0CistLS0gYS9jb25maWd1cmUuYWMKKysrKyBiL2NvbmZpZ3VyZS5h
YworQEAgLTE1NTMsNyArMTU1Myw3IEBAIGZpCisgQU1fQ09ORElUSU9OQUwoW0hBVkVfTlVNQURd
LCBbdGVzdCAiJHdpdGhfbnVtYWQiICE9ICJubyJdKQorIAorIGRubCBwY2FwIGxpYgorLUxJQlBD
QVBfQ09ORklHPSJwY2FwLWNvbmZpZyIKKytMSUJQQ0FQX0NPTkZJRz0icGtnLWNvbmZpZyBsaWJw
Y2FwIgorIExJQlBDQVBfQ0ZMQUdTPSIiCisgTElCUENBUF9MSUJTPSIiCisgTElCUENBUF9GT1VO
RD0ibm8iCitAQCAtMTU2Myw4ICsxNTYzLDggQEAgQUNfQVJHX1dJVEgoW2xpYnBjYXBdLCBbQVNf
SEVMUF9TVFJJTkcoWy0td2l0aC1saWJwY2FwPUA8OkBQRlhAOj5AXSwKKyBpZiB0ZXN0ICIkd2l0
aF9xZW11IiA9ICJ5ZXMiOyB0aGVuCisgICBjYXNlICR3aXRoX2xpYnBjYXAgaW4KKyAgICAgbm8p
ICAgICBMSUJQQ0FQX0NPTkZJRz0gOzsKKy0gICAgJyd8eWVzKSBMSUJQQ0FQX0NPTkZJRz0icGNh
cC1jb25maWciIDs7CistICAgICopICAgICAgTElCUENBUF9DT05GSUc9IiR3aXRoX2xpYnBjYXAv
YmluL3BjYXAtY29uZmlnIiA7OworKyAgICAnJ3x5ZXMpIExJQlBDQVBfQ09ORklHPSJwa2ctY29u
ZmlnIGxpYnBjYXAiIDs7CisrICAgICopICAgICAgTElCUENBUF9DT05GSUc9IiR3aXRoX2xpYnBj
YXAvYmluL3BrZy1jb25maWcgbGlicGNhcCIgOzsKKyAgIGVzYWMKKyAgIEFTX0lGKFt0ZXN0ICJ4
JExJQlBDQVBfQ09ORklHIiAhPSAieCJdLCBbCisgICAgIEFDX01TR19DSEVDS0lORyhsaWJwY2Fw
ICRMSUJQQ0FQX0NPTkZJRyA+PSAkTElCUENBUF9SRVFVSVJFRCApCistLSAKKzIuMS4wCisKZGlm
ZiAtLWdpdCBhL3JlY2lwZXMtZXh0ZW5kZWQvbGlidmlydC9saWJ2aXJ0XzEuMi4xMi5iYiBiL3Jl
Y2lwZXMtZXh0ZW5kZWQvbGlidmlydC9saWJ2aXJ0XzEuMi4xMi5iYgppbmRleCBkY2EyZDFiMmZh
YmMuLjVkZTk1YzM2MWE2NCAxMDA2NDQKLS0tIGEvcmVjaXBlcy1leHRlbmRlZC9saWJ2aXJ0L2xp
YnZpcnRfMS4yLjEyLmJiCisrKyBiL3JlY2lwZXMtZXh0ZW5kZWQvbGlidmlydC9saWJ2aXJ0XzEu
Mi4xMi5iYgpAQCAtMzEsNiArMzEsNyBAQCBTUkNfVVJJID0gImh0dHA6Ly9saWJ2aXJ0Lm9yZy9z
b3VyY2VzL2xpYnZpcnQtJHtQVn0udGFyLmd6O25hbWU9bGlidmlydCBcCiAgICAgICAgICAgIGZp
bGU6Ly9ydW4tcHRlc3QgXAogICAgICAgICAgICBmaWxlOi8vdGVzdHMtYWxsb3ctc2VwYXJhdGVk
LXNyYy1hbmQtYnVpbGQtZGlycy5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly9saWJ2aXJ0LUZp
eC1jYW5ub3Qtc3ltbGluay1jcHVfbWFwLnhtbC1lcnJvci5wYXRjaCBcCisgICAgICAgICAgIGZp
bGU6Ly9saWJ2aXJ0LXVzZS1wa2ctY29uZmlnLXRvLWxvY2F0ZS1saWJjYXAucGF0Y2ggXAogICAg
ICAgICAgICIKIAogU1JDX1VSSVtsaWJ2aXJ0Lm1kNXN1bV0gPSAiMmFlOTk1MzUyNjVjZTQ2ODdk
ODcxOGQ3NDQwMjRjMjciCi0tIAoyLjEuMAoK

--047d7b874b2ca2910f051339cc28--
