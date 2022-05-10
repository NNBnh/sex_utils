# frozen_string_literal: true

require "fileutils"
require "tty-reader"
require_relative "sex_utils/version"

module SexUtils
  class Error < StandardError; end

  class Selection
    def initialize(...)
      @selection = selection
      @reader = TTY::Reader.new(...)
      @reader.on(:keyctrl_c, :keyescape) { exit }
    end

    def get(paths)
      @selection
    end

    def set(paths)
      @selection = Array(paths).flatten.map { |path| File.realpath path }
    end

    def empty(paths)
      @selection = []
    end


    def copy_entry(
      src, dest = nil, preserve = false, dereference_root = false,
      remove_destination = false
    )
      unless src
        scr = @selection
        dest = Dir.pwd
      elsif Array(src).one?
        dest ||= @reader.ask("Copy to", src)
      end

      FileUtils.copy_entry(
        src, dest, preserve = preserve, dereference_root = dereference_root,
        remove_destination = remove_destination
      )
    end

    def copy_file(src, dest = nil, preserve = false, dereference = true)
      unless src
        scr = @selection
        dest = Dir.pwd
      elsif Array(src).one?
        dest ||= @reader.ask("Copy to", src)
      end

      FileUtils.copy_file src, dest, preserve = preserve, dereference = dereference
    end

    def cp(src, dest = nil, preserve: nil, noop: nil, verbose: nil)
      unless src
        scr = @selection
        dest = Dir.pwd
      elsif Array(src).one?
        dest ||= @reader.ask("Copy to", src)
      end

      FileUtils.cp src, dest, preserve: preserv, noop: noop, verbose: verbose
    end

    def cp_r(
      src, dest = nil, preserve: nil, noop: nil, verbose: nil,
      dereference_root: true, remove_destination: nil
    )
      unless src
        scr = @selection
        dest = Dir.pwd
      elsif Array(src).one?
        dest ||= @reader.ask("Copy to", src)
      end

      FileUtils.cp_r(
        src, dest, preserve: preserv, noop: noop, verbose: verbose,
        dereference_root: dereference_root,  remove_destination: remove_destination
      )
    end

    def mv(src, dest = nil, force: nil, noop: nil, verbose: nil, secure: nil)
      unless src
        scr = @selection
        dest = Dir.pwd
      elsif Array(src).one?
        dest ||= @reader.ask("Move to", src)
      end

      @selection = FileUtils.mv(
        src, dest, force: force, noop: noop, verbose: verbose, secure: secure
      )
    end

    def link_entry(src, dest = nil, dereference_root = false, remove_destination = false)
      unless src
        scr = @selection
        dest = Dir.pwd
      elsif Array(src).one?
        dest ||= @reader.ask("Link to", src)
      end

      FileUtils.link_entry(
        src, dest, dereference_root = dereference_root,
        remove_destination = remove_destination
      )
    end

    def ln(targets, link = nil, force: nil, noop: nil, verbose: nil)
      unless targets
        targets = @selection
        link = Dir.pwd
      elsif Array(src).one?
        link ||= @reader.ask("Link from", targets)
      end

      FileUtils.ln targets, link, force: force, noop: noop, verbose: verbose
    end

    def ln_s(targets, link = nil, force: nil, noop: nil, verbose: nil)
      unless targets
        targets = @selection
        link = Dir.pwd
      elsif Array(src).one?
        link ||= @reader.ask("Link from", targets)
      end

      FileUtils.ln_s targets, link, force: force, noop: noop, verbose: verbose
    end

    def ln_sf(targets, link = nil, noop: nil, verbose: nil)
      unless targets
        targets = @selection
        link = Dir.pwd
      elsif Array(src).one?
        link ||= @reader.ask("Link from", targets)
      end

      FileUtils.ln_sf targets, link, noop: noop, verbose: verbose
    end

    def install(
      src, dest = nil, mode: nil, owner: nil, group: nil,
      preserve: nil, noop: nil, verbose: nil
    )
      unless src
        scr = @selection
        dest = Dir.pwd
      elsif Array(src).one?
        dest ||= @reader.ask("Install to", src)
      end

      FileUtils.install(
        src, dest, mode: mode, owner: owner, group: group,
        preserve: preserve, noop: noop, verbose: verbose
      )
    end
  end
end
