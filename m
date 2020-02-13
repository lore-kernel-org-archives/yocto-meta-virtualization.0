Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web12.4330.1581632665844970965
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 13 Feb 2020 14:24:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cnbb9iSJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id f8so8809525edv.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 13 Feb 2020 14:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2WCC5VY/fzpNzFPShy5ql+/usij7IQugn6r7MQ9J4pc=;
        b=cnbb9iSJB37ut7Ue7+eyM1iYpBW+1zE/2BcvysWHnLNS9/PliXTDvtVYWv7DBIcNsy
         xp+QXpmEKNYkeUTRqwhrbOe5LtwR/K/z+5vsM7e6f19ugkHWRgMcbtifZkRiuFQHqhyB
         zcD6/2CoKMiaSs9fvbfQUSzOXXQU8k70STO2ALmF0fmPtyvcJUc8WidbPZBfFmQF2WXR
         2v2S/yK4eLUKjAgEwyNDOWlHNBQsR2ZriSY7tahAAJwkZ1YLCq7CPkj2dDasNpbtFB7R
         tam6vv1eibKqrR5ASsMi/zSQy3wgUPxfke5zMQ8dR4xwlszg67uw6bGtwEjBNZHlRF+z
         Xgmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2WCC5VY/fzpNzFPShy5ql+/usij7IQugn6r7MQ9J4pc=;
        b=dSSzL7wRYX9xD+Ok+NaKKZ2hryq0ZAv/Gx97nJfKI5yJQVOpe5ASX5vX9q24TR3olC
         f87mfAoyzQ8D+q52O2pn3ETlamplh876OphUHKa/nzK6V+hbQ2AXJSVLOwGRLPl61eAQ
         u360pF4X6H+2A1bMEbU2n7vSJFvKLG1qfOTr16hqwKQ3WH7gi8Au9vVo7+sw46TC3GB3
         3rzBeB/m2JX3z4kA6yaMOmKFYI+sRgerncV9vL2qtdVj+U2vEotH8jcoGvBpNhLg8/ZX
         LB6zhaHhJLXMwgUghCtwazqnXeDWH10zFXPCheDtE+/SjVbxz4XZiIgxD0mGXJ1IeOK3
         ahZA==
X-Gm-Message-State: APjAAAXT3ObrNfiXUY7rUAF16mplGAosZ1+7X+aGgaiy30uFLHdD6txd
	kAduYiNgVuYu8WcDorMcAqmr7Bgb/XVqaoQLjeQ=
X-Google-Smtp-Source: APXvYqz2t2bMC0ew9O5TkIEB355Zb1AHINGOyNOiBM8X9NkZwfBO2lILsGuS6WJ/Xqzioh36ieE8y56M5VhGt4CmgTk=
X-Received: by 2002:a17:906:260b:: with SMTP id h11mr18306495ejc.327.1581632663978;
 Thu, 13 Feb 2020 14:24:23 -0800 (PST)
MIME-Version: 1.0
References: <20200204145528.6821-1-Maximilian.Blenk@bmw.de> <15F08DEF7DFE08EB.25222@lists.yoctoproject.org>
In-Reply-To: <15F08DEF7DFE08EB.25222@lists.yoctoproject.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 13 Feb 2020 17:24:12 -0500
Message-ID: <CADkTA4Oakgi=qxFYF2QZFL1-0Qv+EEsbkhtqq-xxqA68s_iw7g@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] lxc: Backport patches for keyring options
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Maximilian Blenk <Maximilian.Blenk@bmw.de>, meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 5, 2020 at 11:18 AM Bruce Ashfield via
Lists.Yoctoproject.Org
<bruce.ashfield=gmail.com@lists.yoctoproject.org> wrote:
>
> On Tue, Feb 4, 2020 at 9:55 AM Maximilian Blenk <Maximilian.Blenk@bmw.de> wrote:
> >
> > The added patches allow to set the SELinux context for the session
> > keyring that is created by lxc. In addition it is possible to disable
> > the creation of a new session keyring completely.
> >
> > Upstream PR: https://github.com/lxc/lxc/pull/3260 (merged)
> >
> > If lxc is executed on a SELinux enabled system, these options can be
> > used to assign the expected label to the session keyring.
>
> As a similar comment to what I was saying about an OVS patch/backport,
> have you tried a bumped SRCREV for lxc that would just pickup the fix
> ?
>
> Since this is for master, I'd rather update, versus backport patches.
>

I see no sign of when 3.3 will be released, and rather than move to
master and a SRCREV, I've gone ahead and merged this.

Bruce

> Bruce
>
> >
> > Signed-off-by: Maximilian Blenk <maximilian.blenk@bmw.de>
> > ---
> >  ...dd-option-to-set-keyring-SELinux-con.patch | 275 ++++++++++++++++++
> >  ...dd-option-to-disable-session-keyring.patch | 217 ++++++++++++++
> >  recipes-containers/lxc/lxc_3.2.1.bb           |   2 +
> >  3 files changed, 494 insertions(+)
> >  create mode 100644 recipes-containers/lxc/files/0001-container.conf-Add-option-to-set-keyring-SELinux-con.patch
> >  create mode 100644 recipes-containers/lxc/files/0002-container.conf-Add-option-to-disable-session-keyring.patch
> >
> > diff --git a/recipes-containers/lxc/files/0001-container.conf-Add-option-to-set-keyring-SELinux-con.patch b/recipes-containers/lxc/files/0001-container.conf-Add-option-to-set-keyring-SELinux-con.patch
> > new file mode 100644
> > index 0000000..0da1be0
> > --- /dev/null
> > +++ b/recipes-containers/lxc/files/0001-container.conf-Add-option-to-set-keyring-SELinux-con.patch
> > @@ -0,0 +1,275 @@
> > +From 5dc7de13feab41e3847fed72fa0d0d9bed21fea5 Mon Sep 17 00:00:00 2001
> > +From: Maximilian Blenk <Maximilian.Blenk@bmw.de>
> > +Date: Wed, 29 Jan 2020 17:09:50 +0100
> > +Subject: [PATCH 2/3] container.conf: Add option to set keyring SELinux context
> > +
> > +lxc set's up a new session keyring for every container by default.
> > +If executed on an SELinux enabled system, by default, the keyring
> > +inherits the label of the creating process. If executed with the
> > +currently available SELinux policy, this means that the keyring
> > +is labeled with the lxc_t type. Applications inside the container,
> > +however, might expect that the keyring is labeled with a certain
> > +context (and will fail to access the keyring if it's not explicitly
> > +allowed in the global policy). This patch introduces the config
> > +option lxc.selinux.context.keyring which enables to specify the
> > +label of the newly created keyring. That is, the keyring can be
> > +labeled with the label expected by the started application.
> > +
> > +Signed-off-by: Maximilian Blenk <Maximilian.Blenk@bmw.de>
> > +---
> > + config/selinux/lxc.te |  3 +++
> > + src/lxc/conf.c        | 10 +++++++++-
> > + src/lxc/conf.h        |  1 +
> > + src/lxc/confile.c     | 24 ++++++++++++++++++++++++
> > + src/lxc/lsm/lsm.c     | 13 +++++++++++++
> > + src/lxc/lsm/lsm.h     |  2 ++
> > + src/lxc/lsm/selinux.c | 13 +++++++++++++
> > + src/lxc/utils.c       |  9 ++++++++-
> > + src/lxc/utils.h       |  2 +-
> > + 9 files changed, 74 insertions(+), 3 deletions(-)
> > +
> > +diff --git a/config/selinux/lxc.te b/config/selinux/lxc.te
> > +index bb4bfe3a8..d3f78d80b 100644
> > +--- a/config/selinux/lxc.te
> > ++++ b/config/selinux/lxc.te
> > +@@ -84,5 +84,8 @@ allow lxc_t self:packet_socket create_socket_perms;
> > + allow lxc_t self:rawip_socket create_socket_perms;
> > + allow lxc_t self:netlink_route_socket create_netlink_socket_perms;
> > +
> > ++# Needed to set label that the keyring will be created with
> > ++allow lxc_t self:process { setkeycreate };
> > ++
> > + dontaudit lxc_t sysctl_kernel_t:file write;
> > + dontaudit lxc_t sysctl_modprobe_t:file write;
> > +diff --git a/src/lxc/conf.c b/src/lxc/conf.c
> > +index 0f8b3c928..b06fbf047 100644
> > +--- a/src/lxc/conf.c
> > ++++ b/src/lxc/conf.c
> > +@@ -2758,6 +2758,7 @@ struct lxc_conf *lxc_conf_init(void)
> > +       new->lsm_aa_profile = NULL;
> > +       lxc_list_init(&new->lsm_aa_raw);
> > +       new->lsm_se_context = NULL;
> > ++      new->lsm_se_keyring_context = NULL;
> > +       new->tmp_umount_proc = false;
> > +       new->tmp_umount_proc = 0;
> > +       new->shmount.path_host = NULL;
> > +@@ -3549,6 +3550,7 @@ int lxc_setup(struct lxc_handler *handler)
> > +       int ret;
> > +       const char *lxcpath = handler->lxcpath, *name = handler->name;
> > +       struct lxc_conf *lxc_conf = handler->conf;
> > ++      char *keyring_context = NULL;
> > +
> > +       ret = lxc_setup_rootfs_prepare_root(lxc_conf, name, lxcpath);
> > +       if (ret < 0) {
> > +@@ -3564,7 +3566,13 @@ int lxc_setup(struct lxc_handler *handler)
> > +               }
> > +       }
> > +
> > +-      ret = lxc_setup_keyring();
> > ++      if (lxc_conf->lsm_se_keyring_context) {
> > ++              keyring_context = lxc_conf->lsm_se_keyring_context;
> > ++      } else if (lxc_conf->lsm_se_context) {
> > ++              keyring_context = lxc_conf->lsm_se_context;
> > ++      }
> > ++
> > ++      ret = lxc_setup_keyring(keyring_context);
> > +       if (ret < 0)
> > +               return -1;
> > +
> > +diff --git a/src/lxc/conf.h b/src/lxc/conf.h
> > +index 2664a1527..bb47b720e 100644
> > +--- a/src/lxc/conf.h
> > ++++ b/src/lxc/conf.h
> > +@@ -295,6 +295,7 @@ struct lxc_conf {
> > +       unsigned int lsm_aa_allow_incomplete;
> > +       struct lxc_list lsm_aa_raw;
> > +       char *lsm_se_context;
> > ++      char *lsm_se_keyring_context;
> > +       bool tmp_umount_proc;
> > +       struct lxc_seccomp seccomp;
> > +       int maincmd_fd;
> > +diff --git a/src/lxc/confile.c b/src/lxc/confile.c
> > +index 36d62cbca..df184af73 100644
> > +--- a/src/lxc/confile.c
> > ++++ b/src/lxc/confile.c
> > +@@ -157,6 +157,7 @@ lxc_config_define(seccomp_allow_nesting);
> > + lxc_config_define(seccomp_notify_cookie);
> > + lxc_config_define(seccomp_notify_proxy);
> > + lxc_config_define(selinux_context);
> > ++lxc_config_define(selinux_context_keyring);
> > + lxc_config_define(signal_halt);
> > + lxc_config_define(signal_reboot);
> > + lxc_config_define(signal_stop);
> > +@@ -253,6 +254,7 @@ static struct lxc_config_t config_jump_table[] = {
> > +       { "lxc.seccomp.notify.proxy",      set_config_seccomp_notify_proxy,        get_config_seccomp_notify_proxy,        clr_config_seccomp_notify_proxy,      },
> > +       { "lxc.seccomp.profile",           set_config_seccomp_profile,             get_config_seccomp_profile,             clr_config_seccomp_profile,           },
> > +       { "lxc.selinux.context",           set_config_selinux_context,             get_config_selinux_context,             clr_config_selinux_context,           },
> > ++      { "lxc.selinux.context.keyring",   set_config_selinux_context_keyring,     get_config_selinux_context_keyring,     clr_config_selinux_context_keyring    },
> > +       { "lxc.signal.halt",               set_config_signal_halt,                 get_config_signal_halt,                 clr_config_signal_halt,               },
> > +       { "lxc.signal.reboot",             set_config_signal_reboot,               get_config_signal_reboot,               clr_config_signal_reboot,             },
> > +       { "lxc.signal.stop",               set_config_signal_stop,                 get_config_signal_stop,                 clr_config_signal_stop,               },
> > +@@ -1489,6 +1491,12 @@ static int set_config_selinux_context(const char *key, const char *value,
> > +       return set_config_string_item(&lxc_conf->lsm_se_context, value);
> > + }
> > +
> > ++static int set_config_selinux_context_keyring(const char *key, const char *value,
> > ++                                            struct lxc_conf *lxc_conf, void *data)
> > ++{
> > ++      return set_config_string_item(&lxc_conf->lsm_se_keyring_context, value);
> > ++}
> > ++
> > + static int set_config_log_file(const char *key, const char *value,
> > +                             struct lxc_conf *c, void *data)
> > + {
> > +@@ -3545,6 +3553,13 @@ static int get_config_selinux_context(const char *key, char *retv, int inlen,
> > +       return lxc_get_conf_str(retv, inlen, c->lsm_se_context);
> > + }
> > +
> > ++static int get_config_selinux_context_keyring(const char *key, char *retv, int inlen,
> > ++                                            struct lxc_conf *c, void *data)
> > ++{
> > ++      return lxc_get_conf_str(retv, inlen, c->lsm_se_keyring_context);
> > ++}
> > ++
> > ++
> > + /* If you ask for a specific cgroup value, i.e. lxc.cgroup.devices.list, then
> > +  * just the value(s) will be printed. Since there still could be more than one,
> > +  * it is newline-separated.
> > +@@ -4405,6 +4420,14 @@ static inline int clr_config_selinux_context(const char *key,
> > +       return 0;
> > + }
> > +
> > ++static inline int clr_config_selinux_context_keyring(const char *key,
> > ++                                                   struct lxc_conf *c, void *data)
> > ++{
> > ++      free(c->lsm_se_keyring_context);
> > ++      c->lsm_se_keyring_context = NULL;
> > ++      return 0;
> > ++}
> > ++
> > + static inline int clr_config_cgroup_controller(const char *key,
> > +                                              struct lxc_conf *c, void *data)
> > + {
> > +@@ -5944,6 +5967,7 @@ int lxc_list_subkeys(struct lxc_conf *conf, const char *key, char *retv,
> > +               strprint(retv, inlen, "dir\n");
> > +       } else if (!strcmp(key, "lxc.selinux")) {
> > +               strprint(retv, inlen, "context\n");
> > ++              strprint(retv, inlen, "context.keyring\n");
> > +       } else if (!strcmp(key, "lxc.mount")) {
> > +               strprint(retv, inlen, "auto\n");
> > +               strprint(retv, inlen, "entry\n");
> > +diff --git a/src/lxc/lsm/lsm.c b/src/lxc/lsm/lsm.c
> > +index 5538c9e84..48c22b700 100644
> > +--- a/src/lxc/lsm/lsm.c
> > ++++ b/src/lxc/lsm/lsm.c
> > +@@ -214,3 +214,16 @@ void lsm_process_cleanup(struct lxc_conf *conf, const char *lxcpath)
> > +
> > +       drv->cleanup(conf, lxcpath);
> > + }
> > ++
> > ++int lsm_keyring_label_set(char *label) {
> > ++
> > ++      if (!drv) {
> > ++              ERROR("LSM driver not inited");
> > ++              return -1;
> > ++      }
> > ++
> > ++      if (!drv->keyring_label_set)
> > ++              return 0;
> > ++
> > ++      return drv->keyring_label_set(label);
> > ++}
> > +diff --git a/src/lxc/lsm/lsm.h b/src/lxc/lsm/lsm.h
> > +index dda740b3d..a645a2fa0 100644
> > +--- a/src/lxc/lsm/lsm.h
> > ++++ b/src/lxc/lsm/lsm.h
> > +@@ -38,6 +38,7 @@ struct lsm_drv {
> > +       char *(*process_label_get)(pid_t pid);
> > +       int (*process_label_set)(const char *label, struct lxc_conf *conf,
> > +                                bool on_exec);
> > ++      int (*keyring_label_set)(char* label);
> > +       int (*prepare)(struct lxc_conf *conf, const char *lxcpath);
> > +       void (*cleanup)(struct lxc_conf *conf, const char *lxcpath);
> > + };
> > +@@ -53,5 +54,6 @@ extern int lsm_process_label_fd_get(pid_t pid, bool on_exec);
> > + extern int lsm_process_label_set_at(int label_fd, const char *label,
> > +                                   bool on_exec);
> > + extern void lsm_process_cleanup(struct lxc_conf *conf, const char *lxcpath);
> > ++extern int lsm_keyring_label_set(char *label);
> > +
> > + #endif /* __LXC_LSM_H */
> > +diff --git a/src/lxc/lsm/selinux.c b/src/lxc/lsm/selinux.c
> > +index 625bcae90..b3d95c310 100644
> > +--- a/src/lxc/lsm/selinux.c
> > ++++ b/src/lxc/lsm/selinux.c
> > +@@ -106,11 +106,24 @@ static int selinux_process_label_set(const char *inlabel, struct lxc_conf *conf,
> > +       return 0;
> > + }
> > +
> > ++/*
> > ++ * selinux_keyring_label_set: Set SELinux context that will be assigned to the keyring
> > ++ *
> > ++ * @label   : label string
> > ++ *
> > ++ * Returns 0 on success, < 0 on failure
> > ++ */
> > ++static int selinux_keyring_label_set(char *label)
> > ++{
> > ++      return setkeycreatecon_raw(label);
> > ++};
> > ++
> > + static struct lsm_drv selinux_drv = {
> > +       .name = "SELinux",
> > +       .enabled           = is_selinux_enabled,
> > +       .process_label_get = selinux_process_label_get,
> > +       .process_label_set = selinux_process_label_set,
> > ++      .keyring_label_set = selinux_keyring_label_set,
> > + };
> > +
> > + struct lsm_drv *lsm_selinux_drv_init(void)
> > +diff --git a/src/lxc/utils.c b/src/lxc/utils.c
> > +index bf4a9c2cb..90852eb87 100644
> > +--- a/src/lxc/utils.c
> > ++++ b/src/lxc/utils.c
> > +@@ -48,6 +48,7 @@
> > +
> > + #include "config.h"
> > + #include "log.h"
> > ++#include "lsm/lsm.h"
> > + #include "lxclock.h"
> > + #include "memory_utils.h"
> > + #include "namespace.h"
> > +@@ -1832,11 +1833,17 @@ int recursive_destroy(char *dirname)
> > +       return r;
> > + }
> > +
> > +-int lxc_setup_keyring(void)
> > ++int lxc_setup_keyring(char *keyring_label)
> > + {
> > +       key_serial_t keyring;
> > +       int ret = 0;
> > +
> > ++      if (keyring_label) {
> > ++              if (lsm_keyring_label_set(keyring_label) < 0) {
> > ++                      ERROR("Couldn't set keyring label");
> > ++              }
> > ++      }
> > ++
> > +       /* Try to allocate a new session keyring for the container to prevent
> > +        * information leaks.
> > +        */
> > +diff --git a/src/lxc/utils.h b/src/lxc/utils.h
> > +index dd6404f0b..7560711b7 100644
> > +--- a/src/lxc/utils.h
> > ++++ b/src/lxc/utils.h
> > +@@ -259,6 +259,6 @@ extern uint64_t lxc_find_next_power2(uint64_t n);
> > + extern int lxc_set_death_signal(int signal, pid_t parent);
> > + extern int fd_cloexec(int fd, bool cloexec);
> > + extern int recursive_destroy(char *dirname);
> > +-extern int lxc_setup_keyring(void);
> > ++extern int lxc_setup_keyring(char *keyring_label);
> > +
> > + #endif /* __LXC_UTILS_H */
> > +--
> > +2.24.1
> > +
> > diff --git a/recipes-containers/lxc/files/0002-container.conf-Add-option-to-disable-session-keyring.patch b/recipes-containers/lxc/files/0002-container.conf-Add-option-to-disable-session-keyring.patch
> > new file mode 100644
> > index 0000000..34647c8
> > --- /dev/null
> > +++ b/recipes-containers/lxc/files/0002-container.conf-Add-option-to-disable-session-keyring.patch
> > @@ -0,0 +1,217 @@
> > +From 8164190b19a0a9070c7e531c9be84f4317f10193 Mon Sep 17 00:00:00 2001
> > +From: Maximilian Blenk <Maximilian.Blenk@bmw.de>
> > +Date: Thu, 30 Jan 2020 19:21:10 +0100
> > +Subject: [PATCH 3/3] container.conf: Add option to disable session keyring
> > + creation
> > +
> > +lxc set's up a new session keyring for every container by default.
> > +There might be valid use-cases where this is not wanted / needed
> > +(e.g. systemd by default creates a new session keyring anyway).
> > +
> > +Signed-off-by: Maximilian Blenk <Maximilian.Blenk@bmw.de>
> > +---
> > + src/lxc/conf.c          | 19 ++++++++++--------
> > + src/lxc/conf.h          |  1 +
> > + src/lxc/confile.c       | 44 ++++++++++++++++++++++-------------------
> > + src/lxc/confile_utils.c | 24 ++++++++++++++++++++++
> > + src/lxc/confile_utils.h |  2 ++
> > + 5 files changed, 62 insertions(+), 28 deletions(-)
> > +
> > +diff --git a/src/lxc/conf.c b/src/lxc/conf.c
> > +index b06fbf047..be4761a54 100644
> > +--- a/src/lxc/conf.c
> > ++++ b/src/lxc/conf.c
> > +@@ -2759,6 +2759,7 @@ struct lxc_conf *lxc_conf_init(void)
> > +       lxc_list_init(&new->lsm_aa_raw);
> > +       new->lsm_se_context = NULL;
> > +       new->lsm_se_keyring_context = NULL;
> > ++      new->keyring_disable_session = false;
> > +       new->tmp_umount_proc = false;
> > +       new->tmp_umount_proc = 0;
> > +       new->shmount.path_host = NULL;
> > +@@ -3566,15 +3567,17 @@ int lxc_setup(struct lxc_handler *handler)
> > +               }
> > +       }
> > +
> > +-      if (lxc_conf->lsm_se_keyring_context) {
> > +-              keyring_context = lxc_conf->lsm_se_keyring_context;
> > +-      } else if (lxc_conf->lsm_se_context) {
> > +-              keyring_context = lxc_conf->lsm_se_context;
> > +-      }
> > ++      if (!lxc_conf->keyring_disable_session) {
> > ++              if (lxc_conf->lsm_se_keyring_context) {
> > ++                      keyring_context = lxc_conf->lsm_se_keyring_context;
> > ++              } else if (lxc_conf->lsm_se_context) {
> > ++                      keyring_context = lxc_conf->lsm_se_context;
> > ++              }
> > +
> > +-      ret = lxc_setup_keyring(keyring_context);
> > +-      if (ret < 0)
> > +-              return -1;
> > ++              ret = lxc_setup_keyring(keyring_context);
> > ++              if (ret < 0)
> > ++                      return -1;
> > ++      }
> > +
> > +       if (handler->ns_clone_flags & CLONE_NEWNET) {
> > +               ret = lxc_setup_network_in_child_namespaces(lxc_conf,
> > +diff --git a/src/lxc/conf.h b/src/lxc/conf.h
> > +index bb47b720e..b81786838 100644
> > +--- a/src/lxc/conf.h
> > ++++ b/src/lxc/conf.h
> > +@@ -296,6 +296,7 @@ struct lxc_conf {
> > +       struct lxc_list lsm_aa_raw;
> > +       char *lsm_se_context;
> > +       char *lsm_se_keyring_context;
> > ++      bool keyring_disable_session;
> > +       bool tmp_umount_proc;
> > +       struct lxc_seccomp seccomp;
> > +       int maincmd_fd;
> > +diff --git a/src/lxc/confile.c b/src/lxc/confile.c
> > +index df184af73..fd8b3aaba 100644
> > +--- a/src/lxc/confile.c
> > ++++ b/src/lxc/confile.c
> > +@@ -110,6 +110,7 @@ lxc_config_define(init_cmd);
> > + lxc_config_define(init_cwd);
> > + lxc_config_define(init_gid);
> > + lxc_config_define(init_uid);
> > ++lxc_config_define(keyring_session);
> > + lxc_config_define(log_file);
> > + lxc_config_define(log_level);
> > + lxc_config_define(log_syslog);
> > +@@ -208,6 +209,7 @@ static struct lxc_config_t config_jump_table[] = {
> > +       { "lxc.init.gid",                  set_config_init_gid,                    get_config_init_gid,                    clr_config_init_gid,                  },
> > +       { "lxc.init.uid",                  set_config_init_uid,                    get_config_init_uid,                    clr_config_init_uid,                  },
> > +       { "lxc.init.cwd",                  set_config_init_cwd,                    get_config_init_cwd,                    clr_config_init_cwd,                  },
> > ++      { "lxc.keyring.session",           set_config_keyring_session,             get_config_keyring_session,             clr_config_keyring_session            },
> > +       { "lxc.log.file",                  set_config_log_file,                    get_config_log_file,                    clr_config_log_file,                  },
> > +       { "lxc.log.level",                 set_config_log_level,                   get_config_log_level,                   clr_config_log_level,                 },
> > +       { "lxc.log.syslog",                set_config_log_syslog,                  get_config_log_syslog,                  clr_config_log_syslog,                },
> > +@@ -1497,6 +1499,12 @@ static int set_config_selinux_context_keyring(const char *key, const char *value
> > +       return set_config_string_item(&lxc_conf->lsm_se_keyring_context, value);
> > + }
> > +
> > ++static int set_config_keyring_session(const char *key, const char *value,
> > ++                                    struct lxc_conf *lxc_conf, void *data)
> > ++{
> > ++      return set_config_bool_item(&lxc_conf->keyring_disable_session, value, false);
> > ++}
> > ++
> > + static int set_config_log_file(const char *key, const char *value,
> > +                             struct lxc_conf *c, void *data)
> > + {
> > +@@ -2553,26 +2561,7 @@ static int set_config_rootfs_path(const char *key, const char *value,
> > + static int set_config_rootfs_managed(const char *key, const char *value,
> > +                                    struct lxc_conf *lxc_conf, void *data)
> > + {
> > +-      unsigned int val = 0;
> > +-
> > +-      if (lxc_config_value_empty(value)) {
> > +-              lxc_conf->rootfs.managed = true;
> > +-              return 0;
> > +-      }
> > +-
> > +-      if (lxc_safe_uint(value, &val) < 0)
> > +-              return -EINVAL;
> > +-
> > +-      switch (val) {
> > +-      case 0:
> > +-              lxc_conf->rootfs.managed = false;
> > +-              return 0;
> > +-      case 1:
> > +-              lxc_conf->rootfs.managed = true;
> > +-              return 0;
> > +-      }
> > +-
> > +-      return -EINVAL;
> > ++      return set_config_bool_item(&lxc_conf->rootfs.managed, value, true);
> > + }
> > +
> > + static int set_config_rootfs_mount(const char *key, const char *value,
> > +@@ -3559,6 +3548,12 @@ static int get_config_selinux_context_keyring(const char *key, char *retv, int i
> > +       return lxc_get_conf_str(retv, inlen, c->lsm_se_keyring_context);
> > + }
> > +
> > ++static int get_config_keyring_session(const char *key, char *retv, int inlen,
> > ++                                    struct lxc_conf *c, void *data)
> > ++{
> > ++      return lxc_get_conf_bool(c, retv, inlen, c->keyring_disable_session);
> > ++}
> > ++
> > +
> > + /* If you ask for a specific cgroup value, i.e. lxc.cgroup.devices.list, then
> > +  * just the value(s) will be printed. Since there still could be more than one,
> > +@@ -4428,6 +4423,13 @@ static inline int clr_config_selinux_context_keyring(const char *key,
> > +       return 0;
> > + }
> > +
> > ++static inline int clr_config_keyring_session(const char *key,
> > ++                                           struct lxc_conf *c, void *data)
> > ++{
> > ++      c->keyring_disable_session = false;
> > ++      return 0;
> > ++}
> > ++
> > + static inline int clr_config_cgroup_controller(const char *key,
> > +                                              struct lxc_conf *c, void *data)
> > + {
> > +@@ -6007,6 +6009,8 @@ int lxc_list_subkeys(struct lxc_conf *conf, const char *key, char *retv,
> > +               strprint(retv, inlen, "order\n");
> > +       } else if (!strcmp(key, "lxc.monitor")) {
> > +               strprint(retv, inlen, "unshare\n");
> > ++      } else if (!strcmp(key, "lxc.keyring")) {
> > ++              strprint(retv, inlen, "session\n");
> > +       } else {
> > +               fulllen = -1;
> > +       }
> > +diff --git a/src/lxc/confile_utils.c b/src/lxc/confile_utils.c
> > +index 6941f4026..02e48454b 100644
> > +--- a/src/lxc/confile_utils.c
> > ++++ b/src/lxc/confile_utils.c
> > +@@ -666,6 +666,30 @@ int set_config_path_item(char **conf_item, const char *value)
> > +       return set_config_string_item_max(conf_item, value, PATH_MAX);
> > + }
> > +
> > ++int set_config_bool_item(bool *conf_item, const char *value, bool empty_conf_action)
> > ++{
> > ++      unsigned int val = 0;
> > ++
> > ++      if (lxc_config_value_empty(value)) {
> > ++              *conf_item = empty_conf_action;
> > ++              return 0;
> > ++      }
> > ++
> > ++      if (lxc_safe_uint(value, &val) < 0)
> > ++              return -EINVAL;
> > ++
> > ++      switch (val) {
> > ++      case 0:
> > ++              *conf_item = false;
> > ++              return 0;
> > ++      case 1:
> > ++              *conf_item = true;
> > ++              return 0;
> > ++      }
> > ++
> > ++      return -EINVAL;
> > ++}
> > ++
> > + int config_ip_prefix(struct in_addr *addr)
> > + {
> > +       if (IN_CLASSA(addr->s_addr))
> > +diff --git a/src/lxc/confile_utils.h b/src/lxc/confile_utils.h
> > +index f68f9604f..83d49bace 100644
> > +--- a/src/lxc/confile_utils.h
> > ++++ b/src/lxc/confile_utils.h
> > +@@ -68,6 +68,8 @@ extern int set_config_string_item(char **conf_item, const char *value);
> > + extern int set_config_string_item_max(char **conf_item, const char *value,
> > +                                     size_t max);
> > + extern int set_config_path_item(char **conf_item, const char *value);
> > ++extern int set_config_bool_item(bool *conf_item, const char *value,
> > ++                                bool empty_conf_action);
> > + extern int config_ip_prefix(struct in_addr *addr);
> > + extern int network_ifname(char *valuep, const char *value, size_t size);
> > + extern void rand_complete_hwaddr(char *hwaddr);
> > +--
> > +2.24.1
> > +
> > diff --git a/recipes-containers/lxc/lxc_3.2.1.bb b/recipes-containers/lxc/lxc_3.2.1.bb
> > index b852515..bedcf13 100644
> > --- a/recipes-containers/lxc/lxc_3.2.1.bb
> > +++ b/recipes-containers/lxc/lxc_3.2.1.bb
> > @@ -45,6 +45,8 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
> >         file://tests-our-init-is-not-busybox.patch \
> >         file://tests-add-no-validate-when-using-download-template.patch \
> >         file://network-restore-ability-to-move-nl80211-devices.patch \
> > +        file://0001-container.conf-Add-option-to-set-keyring-SELinux-con.patch \
> > +        file://0002-container.conf-Add-option-to-disable-session-keyring.patch \
> >         file://dnsmasq.conf \
> >         file://lxc-net \
> >         "
> > --
> > 2.24.1
> >
> >
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
