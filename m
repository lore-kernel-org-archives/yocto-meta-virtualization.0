Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 81DE5E00CAF; Wed, 23 Nov 2016 11:40:39 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.161.193 listed in dnsbl.sorbs.net]
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 17B84E0050B
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 Nov 2016 11:40:37 -0800 (PST)
Received: by mail-yw0-f193.google.com with SMTP id s68so1180117ywg.0
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 Nov 2016 11:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SCoLGRCHeufqfvre8lg4Qx0oAgeVTNET6ZftyswKaBo=;
	b=HssC0zrbx1frPK/6BgSkztcNx+OtRzvCsoWMfjTp4blRisL6b94NgTC69T7Vpj95KH
	Ol4XLqhYjvQh66CvqAntmXk8+LRpk7aSy19NB6e18koLnPwcEP+zi5YH0EOF1VP/0bUO
	ibFnlgeifhJXP5VJD84UC16zFLkMZzy+oe6iv7XU+xY/ja63PfDZbZkpNhEPMFQ91V32
	/9IQWFVAgElpFmV5tb/bau542BNkB6SgjpCQuxcplSi0mHtOEDNkdyU+bS8+ccP7D7yW
	26MenPyCKaZxy46BJxdr0ZqQ8HBp9GoZWtw+ipWGo2/fnXT2izPyEshWnJ5NAp2I6iFZ
	hbcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=SCoLGRCHeufqfvre8lg4Qx0oAgeVTNET6ZftyswKaBo=;
	b=BLfXhDsTUlDR/jy2Cl0sfP7NvzqU9UBJZkS1oF2VV7x22EpUEQ+02yI2Lyn7tT0CVO
	TRkUyh7ifBpZ4Jvo9Jrnp2AUtRyzZb+TiOi4fcH2FqXu7OW9WqVVTl9Rd4MZVV8HoQMz
	HG0IsbDMKNKVmiWiGu6uUmsUWhCirHbSLY7a6/CrsTm6v/zfcHlhtPdtfcFDCz54iTrX
	Oj8OrK2qrW/knwmUAiBjRfRVHV/iAlPKbNxnFSffG4Zlddbtidmpu1jYnlT6d8oY8YkP
	COLWLpXUQkiSqio+SEyN+s8bZEgexQj5dNcSQ2YgmzFGTthoRTCKxKyclvSPmM/28Vzr
	BR0A==
X-Gm-Message-State: AKaTC02mqSbeRs61SyAkC41yP2SoAo0LFFvA4e7dNmhpg+c02Vg53TVB/ceOViXgWAkZlGO1kpxdsZG/kmIRzA==
X-Received: by 10.129.125.215 with SMTP id y206mr5107064ywc.234.1479930036835; 
	Wed, 23 Nov 2016 11:40:36 -0800 (PST)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.171.82 with HTTP; Wed, 23 Nov 2016 11:40:36 -0800 (PST)
In-Reply-To: <CADkTA4P7dbu+vP_ss1Xcf=MBjT9o-N5k5fo8x2bN1BYS0hrADQ@mail.gmail.com>
References: <1479840976-10540-1-git-send-email-mark.asselstine@windriver.com>
	<1479840976-10540-5-git-send-email-mark.asselstine@windriver.com>
	<CADkTA4P7dbu+vP_ss1Xcf=MBjT9o-N5k5fo8x2bN1BYS0hrADQ@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Wed, 23 Nov 2016 14:40:36 -0500
X-Google-Sender-Auth: bXd4pLOdWjKhLWy327DAP8atOhY
Message-ID: <CAPuovE+AwtqPRnoafkju3OfVqc9M2VOA5ADoaewkcCpF4uB-nQ@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 4/4] dnsmasq: allow net interfaces to config their own dnsmasq instance
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: mark.asselstine@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Nov 2016 19:40:39 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 23, 2016 at 2:20 PM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
>
> On Tue, Nov 22, 2016 at 1:56 PM, Mark Asselstine
> <mark.asselstine@windriver.com> wrote:
>>
>> This addition to dnsmasq allows an interface to define a dnsmasq
>> configuration file as /var/lib/dnsmasq/%i/dnsmasq.conf and have their
>> dnsmasq instance controlled via systemctl dnsmasq@%i.service (where
>> '%i' is the interface name).
>>
>> To use this simply create the dnsmasq.conf file as above and enable
>> the systemd service like:
>>
>> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
>> ---
>>  recipes-support/dnsmasq/dnsmasq/dnsmasq@.service | 12 ++++++++++++
>>  recipes-support/dnsmasq/dnsmasq_2.%.bbappend     | 16 ++++++++++++++++
>>  2 files changed, 28 insertions(+)
>>  create mode 100644 recipes-support/dnsmasq/dnsmasq/dnsmasq@.service
>>  create mode 100644 recipes-support/dnsmasq/dnsmasq_2.%.bbappend
>>
>> diff --git a/recipes-support/dnsmasq/dnsmasq/dnsmasq@.service
>> b/recipes-support/dnsmasq/dnsmasq/dnsmasq@.service
>> new file mode 100644
>> index 0000000..9e36a36
>> --- /dev/null
>> +++ b/recipes-support/dnsmasq/dnsmasq/dnsmasq@.service
>> @@ -0,0 +1,12 @@
>> +[Unit]
>> +Description=DHCP and DNS caching server for %i.
>> +After=network.target
>> +
>> +[Service]
>> +ExecStart=/usr/bin/dnsmasq -k
>> --conf-file=/var/lib/dnsmasq/%i/dnsmasq.conf
>> +ExecReload=/bin/kill -HUP $MAINPID
>> +Restart=on-failure
>> +RestartSec=5
>> +
>> +[Install]
>> +WantedBy=multi-user.target
>> diff --git a/recipes-support/dnsmasq/dnsmasq_2.%.bbappend
>> b/recipes-support/dnsmasq/dnsmasq_2.%.bbappend
>> new file mode 100644
>> index 0000000..2acfd0c
>> --- /dev/null
>> +++ b/recipes-support/dnsmasq/dnsmasq_2.%.bbappend
>> @@ -0,0 +1,16 @@
>> +# Allow individual network interfaces to easily configure
>> +# their own dnsmasq instance.
>> +
>> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>> +
>> +SRC_URI += " \
>> +    file://dnsmasq@.service \
>> +    "
>> +
>
>
> Let me see if I properly understand this .. since this is bbappend, we are
> going to
> enable this service no matter what if dnsmasq is in an image ?
>
> Like the lxc networking, is there an option to put this into a separate
> package
> "dnsmasq-extra" .. or something better than that ? So that when someone
> wants
> this capability, they have to install the extra package ?
>
> Otherwise, I don't see a way to opt out.

If you do nothing you are opted out, this is just a file on the filesystem
and you see nothing change.

To opt-in you have to create a dnsmasq config file specific to the interface
and then enable the systemd service for that interface.

When you see my updates to meta-overc you will see how it is intended to be
used by the br-int interface.

Mark


>
> Bruce
>
>>
>> +do_install_append() {
>> +    install -d ${D}/${sysconfdir}/systemd
>> +    install -d ${D}/${sysconfdir}/systemd/system
>> +    install -m 644 ${WORKDIR}/dnsmasq@.service
>> ${D}/${sysconfdir}/systemd/system/.
>> +}
>> +
>> +FILES_${PN} += "${sysconfdir}/systemd/system/dnsmasq@.service"
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee at
> its end"
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>

