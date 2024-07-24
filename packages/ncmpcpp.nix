{ config, lib, pkgs, ... }:

{
  programs = {
    ncmpcpp = {
      enable = true;
      mpdMusicDir = "~/mus";
      bindings = [
        { key = "f"; command = "seek_forward "; }
        { key = "X"; command = "toggle_crossfade "; }
        { key = "ctrl-x"; command = "set_crossfade "; }
        { key = "+"; command = "show_clock "; }
        { key = "="; command = "volume_up "; }
        { key = "j"; command = "scroll_down "; }
        { key = "k"; command = "scroll_up "; }
        { key = "ctrl-u"; command = "page_up "; }
        { key = "ctrl-d"; command = "page_down "; }
        { key = "u"; command = "page_up "; }
        { key = "d"; command = "page_down "; }
        { key = "h"; command = "previous_column "; }
        { key = "l"; command = "next_column "; }
        { key = "."; command = "show_lyrics "; }
        { key = "n"; command = "next_found_item "; }
        { key = "N"; command = "previous_found_item "; }
        { key = "J"; command = "move_sort_order_down "; }
        { key = "K"; command = "move_sort_order_up "; }
        { key = "h"; command = "jump_to_parent_directory "; }
        { key = "l"; command = "enter_directory "; }
        { key = "l"; command = "run_action "; }
        { key = "l"; command = "play_item "; }
        { key = "m"; command = "show_media_library "; }
        { key = "m"; command = "toggle_media_library_columns_mode "; }
        { key = "t"; command = "show_tag_editor "; }
        { key = "v"; command = "show_visualizer "; }
        { key = "G"; command = "move_end "; }
        { key = "g"; command = "move_home "; }
        { key = "U"; command = "update_database "; }
        { key = "s"; command = "reset_search_engine "; }
        { key = "s"; command = "show_search_engine "; }
        { key = "f"; command = "show_browser "; }
        { key = "f"; command = "change_browse_mode "; }
        { key = "x"; command = "delete_playlist_items "; }
        { key = "P"; command = "show_playlist "; }
      ];
      settings = {
        ncmpcpp_directory = "~/.config/ncmpcpp";
        visualizer_output_name = "my_fifo";
        visualizer_in_stereo = "yes";
        visualizer_look = "+|";
        lyrics_directory = "~/.cache/lyrics";
        # mpd_host = 127.0.0.1
        mpd_host = "/run/user/1000/mpd/socket";
        mpd_port = 6600;
        mpd_crossfade_time = 1;
        message_delay_time = 1;
        song_list_format = "{$4%a - }{%t}|{$8%f$9}$R{$3(%l)$9}";
        song_status_format = "$b{{$8\"%t\"}} $3by {$4%a{ $3in $7%b{ (%y)}} $3}|{$8%f}";
        song_library_format = "{%n - }{%t}|{%f}";
        alternative_header_first_line_format = "$b$1$aqqu$/a$9 {%t}|{%f} $1$atqq$/a$9$/b";
        alternative_header_second_line_format = "{{$4$b%a$/b$9}{ - $7%b$9}{ ($4%y$9)}}|{%D}";
        current_item_prefix = "$(cyan)$r$b";
        current_item_suffix = "$/r$(end)$/b";
        current_item_inactive_column_prefix = "$(magenta)$r";
        current_item_inactive_column_suffix = "$/r$(end)";
        playlist_separate_albums = "yes";
        playlist_display_mode = "columns";
        browser_display_mode = "columns";
        progressbar_look = "->";
        user_interface = "alternative";
        media_library_primary_tag = "artist";
        media_library_albums_split_by_date = "yes";
        statusbar_visibility = "yes";
        cyclic_scrolling = "yes";
        startup_screen = "playlist";
        clock_display_seconds = "yes";
        display_volume_level = "yes";
        display_bitrate = "yes";
        ignore_leading_the = "yes";
        external_editor = "vim";
        use_console_editor = "yes";
        colors_enabled = "yes";
        empty_tag_color = "magenta";
        state_line_color = "yellow";
        main_window_color = "white";
        progressbar_color = "black:b";
        progressbar_elapsed_color = "blue:b";
        statusbar_color = "red";
        statusbar_time_color = "cyan:b";
        player_state_color = "yellow:b";
      };
    };
  };
}
